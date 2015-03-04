// hash.c

// lines 14-20
// dependencies:
#include "ruby/ruby.h"
#include "ruby/st.h"
#include "ruby/util.h"
#include "ruby/encoding.h"
#include "internal.h"
#include <errno.h>
#include "probes.h"

// lines 265-272
// notice the use of RHASH and ntbl
// they are referenced a lot in hash.c
struct st_table *
rb_hash_tbl(VALUE hash)
{
    if (!RHASH(hash)->ntbl) {
        RHASH(hash)->ntbl = st_init_table(&objhash);
    }
    return RHASH(hash)->ntbl;
}

// internal.h
// lines 453-458
// RHash definition
// stores an st_table member called ntbl

struct RHash {
    struct RBasic basic;
    struct st_table *ntbl;      /* possibly 0 */
    int iter_lev;
    const VALUE ifnone;
};

// st.h
// 46-96
// st_table definition
// contains:
//     st_hash_type // what kind of keys
//     st_index_t // number of bins, i.e. length of the array being used
//     int // entries_packed, which seems to be the length of the linked lists allowed before the number of bins is expanded
typedef struct st_table st_table;

typedef st_data_t st_index_t;
typedef int st_compare_func(st_data_t, st_data_t);
typedef st_index_t st_hash_func(st_data_t);

typedef char st_check_for_sizeof_st_index_t[SIZEOF_VOIDP == (int)sizeof(st_index_t) ? 1 : -1];
#define SIZEOF_ST_INDEX_T SIZEOF_VOIDP

struct st_hash_type {
    int (*compare)(ANYARGS /*st_data_t, st_data_t*/); /* st_compare_func* */
    st_index_t (*hash)(ANYARGS /*st_data_t*/);        /* st_hash_func* */
};

#define ST_INDEX_BITS (sizeof(st_index_t) * CHAR_BIT)

#if defined(HAVE_BUILTIN___BUILTIN_CHOOSE_EXPR) && defined(HAVE_BUILTIN___BUILTIN_TYPES_COMPATIBLE_P)
# define ST_DATA_COMPATIBLE_P(type) \
   __builtin_choose_expr(__builtin_types_compatible_p(type, st_data_t), 1, 0)
#else
# define ST_DATA_COMPATIBLE_P(type) 0
#endif

struct st_table {
    const struct st_hash_type *type;
    st_index_t num_bins;
    unsigned int entries_packed : 1;
#ifdef __GNUC__
    /*
     * C spec says,
     *   A bit-field shall have a type that is a qualified or unqualified
     *   version of _Bool, signed int, unsigned int, or some other
     *   implementation-defined type. It is implementation-defined whether
     *   atomic types are permitted.
     * In short, long and long long bit-field are implementation-defined
     * feature. Therefore we want to supress a warning explicitly.
     */
    __extension__
#endif
    st_index_t num_entries : ST_INDEX_BITS - 1;
    union {
    struct {
        struct st_table_entry **bins;
        struct st_table_entry *head, *tail;
    } big;
    struct {
        struct st_packed_entry *entries;
        st_index_t real_entries;
    } packed;
    } as;
};

// st.c
// lines 18-26
// st_table_entry definition
// contains
//     hash value which is also the bin index number
//     unhashed key
//     value
//     next entry in the bin (linked list)
//     previous entry in the bin (doubly linked list)
typedef struct st_table_entry st_table_entry;

struct st_table_entry {
    st_index_t hash;
    st_data_t key;
    st_data_t record;
    st_table_entry *next;
    st_table_entry *fore, *back;
};

// st.c
// 349-362
// note the linked list-like iteration
static st_table_entry *
find_entry(st_table *table, st_data_t key, st_index_t hash_val, st_index_t bin_pos)
{
    register st_table_entry *ptr = table->bins[bin_pos];
    FOUND_ENTRY;
    if (PTR_NOT_EQUAL(table, ptr, hash_val, key)) {
    COLLISION;
    while (PTR_NOT_EQUAL(table, ptr->next, hash_val, key)) {
        ptr = ptr->next;
    }
    ptr = ptr->next;
    }
    return ptr;
}

// st.c
// lines 382-454

int
st_lookup(st_table *table, register st_data_t key, st_data_t *value)
{
    st_index_t hash_val;
    register st_table_entry *ptr;

    hash_val = do_hash(key, table);

    if (table->entries_packed) {
    st_index_t i = find_packed_index(table, hash_val, key);
    if (i < table->real_entries) {
        if (value != 0) *value = PVAL(table, i);
        return 1;
    }
        return 0;
    }

    ptr = find_entry(table, key, hash_val, hash_pos(hash_val, table->num_bins));

    if (ptr == 0) {
    return 0;
    }
    else {
    if (value != 0) *value = ptr->record;
    return 1;
    }
}

int
st_get_key(st_table *table, register st_data_t key, st_data_t *result)
{
    st_index_t hash_val;
    register st_table_entry *ptr;

    hash_val = do_hash(key, table);

    if (table->entries_packed) {
    st_index_t i = find_packed_index(table, hash_val, key);
    if (i < table->real_entries) {
        if (result != 0) *result = PKEY(table, i);
        return 1;
    }
        return 0;
    }

    ptr = find_entry(table, key, hash_val, hash_pos(hash_val, table->num_bins));

    if (ptr == 0) {
    return 0;
    }
    else {
    if (result != 0)  *result = ptr->key;
    return 1;
    }
}

#undef collision_check
#define collision_check 1


static inline st_table_entry *
new_entry(st_table * table, st_data_t key, st_data_t value,
    st_index_t hash_val, register st_index_t bin_pos)
{
    register st_table_entry *entry = st_alloc_entry();

    entry->next = table->bins[bin_pos];
    table->bins[bin_pos] = entry;
    entry->hash = hash_val;
    entry->key = key;
    entry->record = value;

    return entry;
}

// st.c
// line 90-91
// do_hash definition
// notice that do_hash returns st_index_t which is equal to the hash value
// that hash value is retrieved by looking up the table's hash type, e.g. string,
// and then passing the key to that hashtype's hashing function which will hash the key
// see below
#define do_hash(key,table) (st_index_t)(*(table)->type->hash)((key))
// & is a bitwise operator
// the hash_pos function seems like another way to perform the modulus function
// since the hash value could be outside of the actual number of bins (array length)
#define hash_pos(h,n) ((h) & (n - 1))

// st.c
// 1322-1415
// annotations from the source describes the hashing algorithm being used: FNV
// below the annotations are the definitions for the hash algorithms and structs.

/*
 * hash_32 - 32 bit Fowler/Noll/Vo FNV-1a hash code
 *
 * @(#) $Hash32: Revision: 1.1 $
 * @(#) $Hash32: Id: hash_32a.c,v 1.1 2003/10/03 20:38:53 chongo Exp $
 * @(#) $Hash32: Source: /usr/local/src/cmd/fnv/RCS/hash_32a.c,v $
 *
 ***
 *
 * Fowler/Noll/Vo hash
 *
 * The basis of this hash algorithm was taken from an idea sent
 * as reviewer comments to the IEEE POSIX P1003.2 committee by:
 *
 *      Phong Vo (http://www.research.att.com/info/kpv/)
 *      Glenn Fowler (http://www.research.att.com/~gsf/)
 *
 * In a subsequent ballot round:
 *
 *      Landon Curt Noll (http://www.isthe.com/chongo/)
 *
 * improved on their algorithm.  Some people tried this hash
 * and found that it worked rather well.  In an EMail message
 * to Landon, they named it the ``Fowler/Noll/Vo'' or FNV hash.
 *
 * FNV hashes are designed to be fast while maintaining a low
 * collision rate. The FNV speed allows one to quickly hash lots
 * of data while maintaining a reasonable collision rate.  See:
 *
 *      http://www.isthe.com/chongo/tech/comp/fnv/index.html
 *
 * for more details as well as other forms of the FNV hash.
 ***
 *
 * To use the recommended 32 bit FNV-1a hash, pass FNV1_32A_INIT as the
 * Fnv32_t hashval argument to fnv_32a_buf() or fnv_32a_str().
 *
 ***
 *
 * Please do not copyright this code.  This code is in the public domain.
 *
 * LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
 * EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
 * USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
 * OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 *
 * By:
 *  chongo <Landon Curt Noll> /\oo/\
 *      http://www.isthe.com/chongo/
 *
 * Share and Enjoy! :-)
 */

/*
 * 32 bit FNV-1 and FNV-1a non-zero initial basis
 *
 * The FNV-1 initial basis is the FNV-0 hash of the following 32 octets:
 *
 *              chongo <Landon Curt Noll> /\../\
 *
 * NOTE: The \'s above are not back-slashing escape characters.
 * They are literal ASCII  backslash 0x5c characters.
 *
 * NOTE: The FNV-1a initial basis is the same value as FNV-1 by definition.
 */
#define FNV1_32A_INIT 0x811c9dc5

/*
 * 32 bit magic FNV-1a prime
 */
#define FNV_32_PRIME 0x01000193

#ifdef ST_USE_FNV1
static st_index_t
strhash(st_data_t arg)
{
    register const char *string = (const char *)arg;
    register st_index_t hval = FNV1_32A_INIT;

    /*
     * FNV-1a hash each octet in the buffer
     */
    while (*string) {
    /* xor the bottom with the current octet */
    hval ^= (unsigned int)*string++;

    /* multiply by the 32 bit FNV magic prime mod 2^32 */
    hval *= FNV_32_PRIME;
    }
    return hval;
}

// st.c
// 46-73
    /*
     * DEFAULT_MAX_DENSITY is the default for the largest we allow the
     * average number of items per bin before increasing the number of
     * bins
     *
     * DEFAULT_INIT_TABLE_SIZE is the default for the number of bins
     * allocated initially
     *
     */

#define type_numhash st_hashtype_num
const struct st_hash_type st_hashtype_num = {
    st_numcmp,
    st_numhash,
};

/* extern int strcmp(const char *, const char *); */
static st_index_t strhash(st_data_t);
static const struct st_hash_type type_strhash = {
    strcmp,
    strhash,
};

static st_index_t strcasehash(st_data_t);
static const struct st_hash_type type_strcasehash = {
    st_locale_insensitive_strcasecmp,
    strcasehash,
};

// st.c
// 1667-1755

static st_index_t
strhash(st_data_t arg)
{
    register const char *string = (const char *)arg;
    return st_hash(string, strlen(string), FNV1_32A_INIT);
}
#endif

int
st_locale_insensitive_strcasecmp(const char *s1, const char *s2)
{
    unsigned int c1, c2;

    while (1) {
        c1 = (unsigned char)*s1++;
        c2 = (unsigned char)*s2++;
        if (c1 == '\0' || c2 == '\0') {
            if (c1 != '\0') return 1;
            if (c2 != '\0') return -1;
            return 0;
        }
        if ((unsigned int)(c1 - 'A') <= ('Z' - 'A')) c1 += 'a' - 'A';
        if ((unsigned int)(c2 - 'A') <= ('Z' - 'A')) c2 += 'a' - 'A';
        if (c1 != c2) {
            if (c1 > c2)
                return 1;
            else
                return -1;
        }
    }
}

int
st_locale_insensitive_strncasecmp(const char *s1, const char *s2, size_t n)
{
    unsigned int c1, c2;

    while (n--) {
        c1 = (unsigned char)*s1++;
        c2 = (unsigned char)*s2++;
        if (c1 == '\0' || c2 == '\0') {
            if (c1 != '\0') return 1;
            if (c2 != '\0') return -1;
            return 0;
        }
        if ((unsigned int)(c1 - 'A') <= ('Z' - 'A')) c1 += 'a' - 'A';
        if ((unsigned int)(c2 - 'A') <= ('Z' - 'A')) c2 += 'a' - 'A';
        if (c1 != c2) {
            if (c1 > c2)
                return 1;
            else
                return -1;
        }
    }
    return 0;
}

static st_index_t
strcasehash(st_data_t arg)
{
    register const char *string = (const char *)arg;
    register st_index_t hval = FNV1_32A_INIT;

    /*
     * FNV-1a hash each octet in the buffer
     */
    while (*string) {
    unsigned int c = (unsigned char)*string++;
    if ((unsigned int)(c - 'A') <= ('Z' - 'A')) c += 'a' - 'A';
    hval ^= c;

    /* multiply by the 32 bit FNV magic prime mod 2^32 */
    hval *= FNV_32_PRIME;
    }
    return hval;
}

int
st_numcmp(st_data_t x, st_data_t y)
{
    return x != y;
}

st_index_t
st_numhash(st_data_t n)
{
    enum {s1 = 11, s2 = 3};
    return (st_index_t)((n>>s1|(n<<s2)) ^ (n>>s2));
}

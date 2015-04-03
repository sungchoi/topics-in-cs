/* With new keywords */
typedef struct linkedlistnode *ListPointer;

struct linkedlistnode {
  int value;          /* integer value */
  ListPointer rest;   /* rest of list */
} List;

/* Without new keywords */
/*
struct linkedlistnode {
  int value;          // integer value
  struct linkedlistnode *rest;   // rest of list
};
*/

List shift(int value, List list);
int unshift(List list);
int size(List list);
bool empty(List list);
List create_list(int value);
List append_to_list(int value, List list); /* use & to get the pointer address */
List append_to_list_pointer(int value, ListPointer *list);
ListPointer list_pointer_alloc(void); /* Q: Should this be private? */

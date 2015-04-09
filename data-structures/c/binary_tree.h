/* With new keywords */
/* using two members, left and right, to represent the child nodes */
typedef struct binarytreenode *BinaryTreeNodePointer

struct binarytreenode {
  int value;
  BinaryTreeNodePointer left;
  BinaryTreeNodePointer right;
} BinaryTreeNode;

/* without new keywords */
/*

struct binarytreenode {
  int value;
  struct binarytreenode *left;
  struct binarytreenode *right;
};

*/

/* using a single member named children that is equal to an array size of two btnode pointers */
/*

typdef struct binarytreenode *BinaryTreeNodePointer

struct btnode {
  int value;
  BinaryTreeNodePointer[2] children;
} BinaryTreeNode;

*/

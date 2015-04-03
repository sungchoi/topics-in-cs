#include <list.h>

struct stack {
  struct list list;
};

int pop(struct stack);
struct stack push(int value);
int peek(struct stack stack);
int size(struct stack stack);
bool empty(struct stack stack);

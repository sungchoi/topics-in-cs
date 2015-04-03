#include <list.h>

struct queue {
  struct link head;
  struct link tail;
};

struct queue enqueue(int value, struct queue queue);
int dequeue(struct queue queue);
int peek(struct queue queue);
int size(struct queue queue);

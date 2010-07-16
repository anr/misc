#ifndef H_QUEUE
#define H_QUEUE

#define QUEUE_MAX_SIZE 1024

typedef struct {
    int elements[QUEUE_MAX_SIZE];
    int start;
    int size;
} queue;

queue *queue_init();
void   queue_destroy(queue *q);
int    enqueue(queue *q, int element);
int    dequeue(queue *q);
int    queue_size(queue *q);
int    queue_max_size(void);

#endif

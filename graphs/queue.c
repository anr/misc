#include <stdio.h>
#include <stdlib.h>
#include "queue.h"

static void error(char *msg)
{
    fprintf(stderr, "%s\n", msg);
    exit(EXIT_FAILURE);
}

queue *queue_init(void)
{
    queue *q;

    if ((q = malloc(sizeof(queue))) == NULL)
        error("malloc failed");

    q->start = 0;
    q->size = 0;

    return q;
}

void queue_destroy(queue *q)
{
    free(q);
}

int enqueue(queue *q, int element)
{
    if (q->size == QUEUE_MAX_SIZE)
        return 0;

    q->elements[(q->start + q->size) % QUEUE_MAX_SIZE] = element;

    q->size++;

    return 1;
}

int dequeue(queue *q)
{
    int element;

    if (q->size == 0)
        error("queue underflow");

    element = q->elements[q->start];

    q->start = (q->start + 1) % QUEUE_MAX_SIZE;
    q->size -= 1;

    return element;
}

int queue_size(queue *q)
{
    return q->size;
}

int queue_max_size()
{
    return QUEUE_MAX_SIZE;
}

#include <stdio.h>
#include <stdlib.h>
#include "graph.h"
#include "queue.h"

enum vertex_states { UNDISCOVERED, DISCOVERED, PROCESSED };
enum dfs_data      { STATES, ENTRIES, EXITS, PARENTS };

static void error(char *msg)
{
    fprintf(stderr, "%s\n", msg);
    exit(EXIT_FAILURE);
}

int *alloc_vector(num_vertices)
{
    int *v = malloc(num_vertices * sizeof(int));

    if (v == NULL)
        error("malloc failed");

    return v;
}

void breadth_first_search(graph *g, int start_vertex)
{
    int i, vertex, neighbor;
    int *states, *parents;
    edge *e;
    queue *q;

    states  = alloc_vector(g->num_vertices);
    parents = alloc_vector(g->num_vertices);

    q = queue_init();

    for (i = 0; i < g->num_vertices; i++) {
        states[i]  = UNDISCOVERED;
        parents[i] = -1;
    }

    states[start_vertex] = DISCOVERED;
    enqueue(q, start_vertex);

    while (queue_size(q) != 0) {
        vertex = dequeue(q);
        e = g->vertices[vertex];

        while (e != NULL) {
            neighbor = e->to_vertex;

            if (states[neighbor] == UNDISCOVERED) {
                states[neighbor]  = DISCOVERED;
                parents[neighbor] = vertex;

                enqueue(q, neighbor);
            }

            e = e->next;
        }

        states[vertex] = PROCESSED;
    }

    queue_destroy(q);

    for (i = 0; i < g->num_vertices; i++)
        printf("vertex %d: parent %d\n", i, parents[i]);

    free(states);
    free(parents);
}

void depth_first_search(graph *g, int start_vertex)
{
    int i;
    int *d[4]; /* states, entries, exits, parents */

    for (i = 0; i < 4; i++)
        d[i] = alloc_vector(g->num_vertices);

    /* dfs(g, start_vertex, d); */

    for (i = 0; i < 4; i++)
        free(d[i]);
}

void topological_sort(graph *g)
{
}

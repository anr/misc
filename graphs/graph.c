#include <stdio.h>
#include <stdlib.h>
#include "graph.h"

void error(char *msg)
{
    fprintf(stderr, "%s\n", msg);
    exit(EXIT_FAILURE);
}

graph *graph_init(int num_vertices, int type)
{
    int i;
    graph *g;

    if ((g = malloc(sizeof(graph))) == NULL)
        error("malloc failed");

    if ((g->vertices = malloc(num_vertices * sizeof(edge *))) == NULL)
        error("malloc failed");

    g->type = type;
    g->num_vertices = num_vertices;

    for (i = 0; i < num_vertices; i++)
        g->vertices[i] = NULL;

    return g;
}

void graph_destroy(graph *g)
{
    int i;
    edge *e, *e_temp;

    for (i = 0; i < g->num_vertices; i++) {
        e = g->vertices[i];

        while (e != NULL) {
            e_temp = e;
            e = e->next;
            free(e_temp);
        }
    }

    free(g->vertices);
    free(g);
}

static void create_edge(graph *g, int from, int to)
{
    edge *e;

    if ((e = malloc(sizeof(edge))) == NULL)
        error("malloc failed");

    e->next = g->vertices[from];
    e->to_vertex = to;
    g->vertices[from] = e;
}

int graph_add_edge(graph *g, int from, int to)
{
    if (from < 0 || to < 0 || from >= g->num_vertices || to >= g->num_vertices) {
        fprintf(stderr, "add_edge: illegal vertex number on edge %d -> %d\n", from, to);
        exit(EXIT_FAILURE);
    }

    create_edge(g, from, to);

    if (g->type == UNDIRECTED)
        create_edge(g, to, from);

    return 1;
}

void graph_print(graph *g)
{
    int i;
    edge *e;

    for (i = 0; i < g->num_vertices; i++) {
        printf("%d: ", i);

        e = g->vertices[i];

        while (e != NULL) {
            printf("%d ", e->to_vertex);
            e = e->next;
        }

        printf("\n");
    }
}

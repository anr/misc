#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "graph.h"
#include "graph_utils.h"

void print_title(char *name)
{
    int i;
    int size = strlen(name);
    char *under = malloc(size + 1);

    for (i = 0; i < size; i++)
        under[i] = '=';
    under[i] = '\0';

    printf("%s\n%s\n\n", name, under);
    free(under);
}

int main(void)
{
    /* FIXME: load graph from file */

    graph *g = graph_init(6, UNDIRECTED);

    graph_add_edge(g, 0, 1);
    graph_add_edge(g, 0, 2);
    graph_add_edge(g, 1, 2);
    graph_add_edge(g, 1, 3);
    graph_add_edge(g, 1, 4);
    graph_add_edge(g, 2, 3);
    graph_add_edge(g, 3, 4);
    graph_add_edge(g, 4, 5);

    print_title("Graph");
    graph_print(g);
    printf("\n");

    print_title("BFS");
    breadth_first_search(g, 0);
    printf("\n");

    print_title("DFS");
    depth_first_search(g, 0);

    graph_destroy(g);

    return 0;
}

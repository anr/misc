#ifndef H_GRAPH
#define H_GRAPH

enum graph_type { UNDIRECTED, DIRECTED };

typedef struct _edge {
    struct _edge *next;
    int to_vertex;
    int weight;
} edge;

typedef struct {
    int type;
    int num_vertices;
    edge **vertices;
} graph;

graph *graph_init(int num_vertices, int type);
void   graph_destroy(graph *g);
int    graph_add_edge(graph *g, int from, int to);
void   graph_print(graph *g);

#endif

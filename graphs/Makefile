CC      = gcc
CFLAGS  = -Wall -ansi
SOURCES = $(wildcard *.c)
OBJS    = $(SOURCES:.c,.o)
BINS    = graph_test

all: $(BINS)

graph_test: graph_test.o graph_utils.o graph.o queue.o
	$(CC) $^ -o $@

clean:
	rm -f *.o *~ $(BINS)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $<

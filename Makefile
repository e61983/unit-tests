EXEC = bin-swap bin-bubble
.PHONY: all
all: $(EXEC)

CC ?= gcc
CFLAGS = -std=gnu99 -Wall -O2 -g
LDFLAGS =

OBJS := \
	swap.o \
	bubble.o \
	stub.o

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

bin-swap: swap.o stub.o
	$(CC) -o $@ $^ $(LDFLAGS)

bin-bubble: stub.o swap.o bubble.o
	$(CC) -o $@ $^ $(LDFLAGS)

check: $(EXEC)
	bash test-swap.sh data-swap.in result-swap
	bash test-bubble.sh data-bubble.in result-bubble

clean:
	$(RM) $(EXEC) $(OBJS)

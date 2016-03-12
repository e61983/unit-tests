#ifndef _LIST_H_
#define _LIST_H_

typedef struct List {
    int value;
    struct List *next;
}List, *pList;

extern pList swap(pList head, pList node_1, pList node_2);
#endif

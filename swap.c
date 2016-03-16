#include "common.h"

#define SWAP(node1,node2) \
{ \
    pList tmp_node = node1->next; \
    node1->next = node2->next; \
    node2->next = tmp_node; \
}

pList swap(pList head, pList node_1, pList node_2)
{
    if (!head &&
            (node_1 == NULL) && (node_2 == NULL) &&
            (node_1 == node_2))
        return head;

    pList pre_node_1 = NULL;
    pList pre_node_2 = NULL;
    pList root = head;

    /* find pre_node */
    for (; head && head->next && head->next != root ; head = head->next) {
        if (head->next == node_1) {
            pre_node_1 = head;
        }

        if (head->next == node_2) {
            pre_node_2 = head;
        }
    }

    /* case: swap with head  */
    if( node_1 == root || node_2 ==root) {
        pList first_node = node_1 == root ? node_1:node_2;
        pList second_node = node_1 == root ? node_2:node_1;
        pList pre_node = node_1 == root ? pre_node_2:pre_node_1;

        if(!pre_node)
            return root;

        pre_node->next = first_node;
        SWAP(first_node, second_node);
        return second_node;
    }

    /* node1 or node2 can't find pre node  */
    if(!(pre_node_1 && pre_node_2))
        return root ;

    /* swap */
    pre_node_1->next = node_2;
    pre_node_2->next = node_1;
    SWAP(node_1, node_2);
    return root;
}

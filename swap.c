#include "common.h"
pList swap(pList head, pList node_1, pList node_2)
{
    if (!head &&
            (node_1 == NULL) && (node_2 == NULL) &&
            (node_1 == node_2))
        return head;

    int num_pre_node_1_and_node_2 = 0;

    pList _head = head;
    pList pre_node_1 = NULL;
    pList pre_node_2 = NULL;
    pList tmp_node = NULL;

    while (head && head->next) {
        if (head->next == node_1) {
            pre_node_1 = head;
            num_pre_node_1_and_node_2 = num_pre_node_1_and_node_2 + 1;
        }

        if (head->next == node_2) {
            pre_node_2 = head;
            num_pre_node_1_and_node_2 = num_pre_node_1_and_node_2 + 1;
        }
        head = head->next;
    }

    head = _head;
    if (head == node_1) {
        pre_node_1 = NULL;
        num_pre_node_1_and_node_2 = num_pre_node_1_and_node_2 + 1;
    }

    if (head == node_2) {
        pre_node_2 = NULL;
        num_pre_node_1_and_node_2 = num_pre_node_1_and_node_2 + 1;
    }

    if (num_pre_node_1_and_node_2 != 2)
        return head;

    if (pre_node_1 == NULL) {
        pre_node_2->next = node_1;
        tmp_node = node_1->next;
        node_1->next = node_2->next;
        node_2->next = tmp_node;
        return node_2;
    }

    if (pre_node_2 == NULL) {
        pre_node_1->next = node_2;
        tmp_node = node_2->next;
        node_2->next = node_1->next;
        node_1->next = tmp_node;
        return node_1;
    }

    if (node_2->next == node_1) {
        pre_node_2->next = node_1;
        tmp_node = node_1->next;
        node_1->next = node_2;
        node_2->next = tmp_node;
        return head;
    }

    if (node_1->next == node_2) {
        pre_node_1->next = node_2;
        tmp_node = node_2->next;
        node_2->next = node_1;
        node_1->next = tmp_node;
        return head;
    }

    pre_node_1->next = node_2;
    tmp_node = node_2->next;
    node_2->next = node_1->next;
    pre_node_2->next = node_1;
    node_1->next = tmp_node;
    return head;
}

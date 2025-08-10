#include "simple_linked_list.h"

#include <stdexcept>

namespace simple_linked_list {

std::size_t List::size() const {
    return current_size;
    }

void List::push(int entry) {
    Element* node = new Element{entry};
    node->next = head;
    head = node;
    current_size++;
}

int List::pop() {
    if(!head) throw std::runtime_error("Cannot pop from empty list!");
    int value = head->data;
    Element* p = head;
    head = head->next;
    delete p;
    current_size--;
    return value;
}

void List::reverse() {
        Element* new_start = nullptr;
        while(head) {
            Element* tmp = new_start;
            new_start = head;
            head = head -> next;
            new_start->next = tmp;
         }
        head = new_start;
    }

List::~List() {
    while(head){
        this->pop();
    }
}

}  // namespace simple_linked_list

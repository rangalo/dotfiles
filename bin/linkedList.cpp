#include <iostream>

using namespace std;

struct Node {
    int data;
    Node * next;
};

class LinkedList {
    Node * head;
    Node * current;

    public:

        LinkedList() {
            head = current = NULL;
        }


        bool append(int val) {

            Node * temp = new Node;
            temp->data = val;
            temp->next = NULL;

            if (NULL == head) {
                cout << "Setting head to temp" << endl;
                head = temp;
                current = temp;
            } else {
                current->next = temp;
                current = temp;
            }
            return true;
        }


        void printList() {
            Node * tmp = head;
            if (NULL == head) {
                cout << "Empty list" << endl;
                return;
            }
            while(tmp->next) {
                cout << "data: " << tmp->data << endl;
                tmp = tmp->next;
            }
            
        }

};

int main() {

    LinkedList list = LinkedList();
    list.printList();

    list.append(4);

    list.printList();
    return 1;

}



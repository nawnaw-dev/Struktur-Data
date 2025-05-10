class Node<T> {
  T? nodeValue;  //menyimpan data/value dari Node
  Node<T>? next; //Menunjuk ke node berikutnya

  // Default constructor (tanpa nilai)
  Node() {
    nodeValue = null;
    next = null;
  }

  // Constructor dengan nilai
  Node.withValue(T item) {
    nodeValue = item;
    next = null;
  }
}

class SingleLinkedList<T> {
  Node<T>? head; 

  bool isEmpty() {
    return head == null;
  }

  // Menambahkan node di akhir list
  void append(T value) {
    var newNode = Node.withValue(value);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node<T>? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  // Menampilkan isi list
  void printList() {
    if (isEmpty()) {
      print("List kosong");
      return;
    }

    Node<T>? temp = head;
    while (temp != null) {
      print(temp.nodeValue);
      temp = temp.next;
    }
  }
}

void main() {
  var list = SingleLinkedList<int>();

  list.append(10);
  list.append(20);
  list.append(30);

  print("Isi list:");
  list.printList();
}

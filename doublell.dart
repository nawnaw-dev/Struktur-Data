import 'dart:io';

class DNode<T> {
  T nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.nodeValue);
}

class DoubleLinkedList<T> {
  DNode<T>? head;
  DNode<T>? tail;

  bool isEmpty() {
    return head == null;
  }

  void append(T value) {
    var newNode = DNode<T>(value);
    if (head == null) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  void insertBeforeHead(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      append(data);
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  void insertTailNode(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      append(data);
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    if (isEmpty()) {
      print("List kosong,tidak bisa menambahkan node");
      return;
    }

    // Jika target adalah head
    if (target == head) {
      insertBeforeHead(newNode.nodeValue);
      return;
    }

    // Menambahkan node baru sebelum target
    newNode.prev = target.prev;
    newNode.next = target;

    if (target.prev != null) {
      target.prev!.next = newNode;
    }
    target.prev = newNode;
  }

  void printList(DNode<T>? node) {
    DNode<T>? tail;
    tail = null;
    print("Traversal in Forward Direction: ");
    while (node != null) {
      stdout.write("${node.nodeValue} ");
      tail = node;
      node = node.next;
    }
    print("");
    print("Traversal in Reverse Direction: ");
    while (tail != null) {
      stdout.write("${tail.nodeValue} ");
      tail = tail.prev;
    }
    print('');
  }
}

void main() {
  var list = DoubleLinkedList<int>();

  list.insertBeforeHead(10);
  list.insertBeforeHead(20);
  list.insertTailNode(30);

  list.printList(list.head);
  
  DNode<int> newNode = DNode<int>(40);
  list.tambahNode_Sebelum(newNode, list.head!.next!);
  list.printList(list.head);
}

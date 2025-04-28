class CircularQueue {
  final int maxQueue = 4;
  List<int> element;
  int front = 0;
  int rear = 0;

  CircularQueue()
      : element = List.filled(5, 0); // 0..4, ukuran = maxQueue + 1

  bool isFull() {
    bool flag = true;
    for (int i = 0; i <= maxQueue; i++) {
      if (element[i] == 0) {
        flag = false;
        break;
      }
    }
    return flag;
  }

  bool isEmpty() {
    bool flag = true;
    for (int i = 0; i <= maxQueue; i++) {
      if (element[i] != 0) {
        flag = false;
        break;
      }
    }
    return flag;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      if (rear != maxQueue) {
        rear += 1;
      } else {
        rear = 0;
      }
      element[rear] = data;
    }
  }

  int dequeue() {
    int data = 0;
    if (isEmpty()) {
      print("Queue Underflow");
    } else {
      if (front != maxQueue) {
        front += 1;
      } else {
        front = 0;
      }
      data = element[front];
      element[front] = 0;
    }
    return data;
  }

  void printQueue() {
    print("Isi Queue: ${element}");
  }
}

void main() {
  CircularQueue queue = CircularQueue();

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.printQueue();

  print("Dequeued: ${queue.dequeue()}");
  queue.printQueue();

  queue.enqueue(50);
  queue.printQueue();

  print("Dequeued: ${queue.dequeue()}");
  queue.printQueue();
}

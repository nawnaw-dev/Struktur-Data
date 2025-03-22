import 'dart:math';

void bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> data = List.generate(450000, (_) => Random().nextInt(50000));
  DateTime start = DateTime.now();
  bubbleSort(data);
  DateTime end = DateTime.now();
  print("Bubble Sort Time: ${end.difference(start).inMilliseconds} ms");
}

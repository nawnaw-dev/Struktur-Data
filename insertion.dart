import 'dart:math';

void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void main() {
  List<int> data = List.generate(500000, (_) => Random().nextInt(50000));
  DateTime start = DateTime.now();
  insertionSort(data);
  DateTime end = DateTime.now();
  print("Insertion Sort Time: ${end.difference(start).inMilliseconds} ms");
}

import 'dart:math';

void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
}

void main() {
  List<int> data = List.generate(500000, (_) => Random().nextInt(50000));
  DateTime start = DateTime.now();
  selectionSort(data);
  DateTime end = DateTime.now();
  print("Selection Sort Time: ${end.difference(start).inMilliseconds} ms");
}

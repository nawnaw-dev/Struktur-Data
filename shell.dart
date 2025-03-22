import 'dart:math';

void shellSort(List<int> arr) {
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j;
      for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
        arr[j] = arr[j - gap];
      }
      arr[j] = temp;
    }
  }
}

void main() {
  List<int> data = List.generate(450000, (_) => Random().nextInt(50000));
  DateTime start = DateTime.now();
  shellSort(data);
  DateTime end = DateTime.now();
  print("Shell Sort Time: ${end.difference(start).inMilliseconds} ms");
}

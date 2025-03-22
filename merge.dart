import 'dart:math';

void mergeSort(List<int> arr) {
  if (arr.length <= 1) return;

  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  mergeSort(left);
  mergeSort(right);

  merge(arr, left, right);
}

void merge(List<int> arr, List<int> left, List<int> right) {
  int i = 0, j = 0, k = 0;

  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      arr[k++] = left[i++];
    } else {
      arr[k++] = right[j++];
    }
  }

  while (i < left.length) arr[k++] = left[i++];
  while (j < right.length) arr[k++] = right[j++];
}

void main() {
  List<int> data = List.generate(500000, (_) => Random().nextInt(50000));
  DateTime start = DateTime.now();
  mergeSort(data);
  DateTime end = DateTime.now();
  print("Merge Sort Time: ${end.difference(start).inMilliseconds} ms");
}

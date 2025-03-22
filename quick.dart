import 'dart:math';

void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (arr[j] < pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  return i + 1;
}

void main() {
  List<int> data = List.generate(500000, (_) => Random().nextInt(50000));
  DateTime start = DateTime.now();
  quickSort(data, 0, data.length - 1);
  DateTime end = DateTime.now();
  print("Quick Sort Time: ${end.difference(start).inMilliseconds} ms");
}

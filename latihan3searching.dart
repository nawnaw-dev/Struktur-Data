List<int> sequentialSearch(List<int> arr, int x) {
  List<int> data = [];
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == x) {
      data.add(i);
    }
  }
  return data;
}

void main() {
  List<int> arr = [2, 3, 4, 10 , 40, 3, 4, 4, 4, 3, 2, 40];
  int x = 4;

  List<int> result = sequentialSearch(arr, x);
  if (result.isEmpty)
    print("Element tidak ada di array");
  else
    print("Element ${x} berada di indeks ke ${result.join(', ')}");
}

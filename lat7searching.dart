import 'dart:io';

int binarySearch(List<int> data, int x) {
  int left = 0;
  int right = data.length - 1;

  while (left <= right) {
    int mid = (left + right) ~/ 2;

    if (data[mid] == x) return mid;
    if (data[mid] < x) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

void main() {
  List<int> data = [5, 9, 3, 1, 2, 6, 4];
  int x = 2;

  //menyimpan data dengan indeks asli
  List<int> dataAsli = List.from(data);

  //membuat list index
  List<int> indexMap = List.generate(data.length, (i) => i);
  indexMap.sort((a, b) => data[a].compareTo(data[b]));

  //list data yang sudah diurutkan
  List<int> sortedData = indexMap.map((i) => data[i]).toList();

  // memanggil fungsi binary search
  int foundIndex = binarySearch(sortedData, x);
  
  stdout.write('Data sebelum diurutkan: $dataAsli');
  if (foundIndex != -1) {
    int originalIndex = indexMap[foundIndex];
    print('\nElemen $x ditemukan pada indeks ke $originalIndex');
  } else {
    print('Elemen $x tidak ditemukan.');
  }
}

class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  String toString() {
    return 'Mahasiswa{nrp: $nrp, nama: $nama}';
  }

  @override
  int compareTo(Mahasiswa other) {
    //membandingkan berdasarkan NRP
    return nrp.compareTo(other.nrp);
  }
}

class Latihan {
  static int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
    //logika partition
    T pivot = arr[r];
    int i = p - 1;
    for (int j = p; j < r; j++) {
      if (arr[j].compareTo(pivot) <= 0) {
        i++;
        T temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
    T temp = arr[i + 1];
    arr[i + 1] = arr[r];
    arr[r] = temp;
    return i + 1;
  }

  static void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
    // logika quicksort
    if (p < r) {
      int q = partition(arr, p, r);
      quickSort(arr, p, q - 1);
      quickSort(arr, q + 1, r);
    }
  }

  static void tampil<T>(List<T> data) { //logika tampil
    data.forEach((element) => print(element));
  }
}

void main() {
  List<Mahasiswa> arr8 = [
    Mahasiswa("02", "Naura"),
    Mahasiswa("01", "Adel"),
    Mahasiswa("04", "Naila"),
    Mahasiswa("03", "Shavira"),
  ];

  print("Sebelum sorting:");
  Latihan.tampil(arr8);

  DateTime startTime = DateTime.now();
  Latihan.quickSort(arr8, 0, arr8.length - 1); // Memanggil quickSort dengan namespace yang benar
  Duration elapsedTime = DateTime.now().difference(startTime);

  print("\nSetelah sorting:");
  Latihan.tampil(arr8);
  
  print('\nWaktu eksekusi: ${elapsedTime.inMilliseconds}');
}

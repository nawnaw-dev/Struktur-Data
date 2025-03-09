import 'dart:io';

void cetakKombinasi(List<String> karakter, int panjang, String kombinasi) {
  if (kombinasi.length==panjang) {
    print(kombinasi);
    return;
  }
  for (String char in karakter) {
    cetakKombinasi(karakter, panjang, kombinasi + char);
  }
}

void main() {
  stdout.write('Masukkan jumlah karakter: ');
  int n=int.parse(stdin.readLineSync()!);
  List<String> karakter = ['a', 'b', 'c'];
  cetakKombinasi(karakter, n, '');
}

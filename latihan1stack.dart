import 'dart:io';

class Konversi {
  void konversiDesimal(int desimal) {
    String biner = desimal.toRadixString(2);
    String oktal = desimal.toRadixString(8);
    String heksadesimal = desimal.toRadixString(16).toUpperCase();

    print('Hasil nilai biner = $biner');
    print('Hasil nilai oktal = $oktal');
    print('Hasil nilai heksadesimal = $heksadesimal');
  }
}

class Kalimat {
  void prosesKalimat(String kalimat) {
    String dibalik = kalimat.split('').reversed.join('');
    print('Hasil = $dibalik');

    if (kalimat == dibalik) {
      print('Kalimat tersebut merupakan Kalimat Palindrom');
    } else {
      print('Kalimat tersebut Bukan Kalimat palindrom');
    }
  }
}

void main() {
  // Bagian a: Konversi desimal
  print('Masukkan nilai desimal: ');
  int desimal = int.parse(stdin.readLineSync()!);
  Konversi konversi = Konversi();
  konversi.konversiDesimal(desimal);

  // Bagian b: Membalik kalimat dan memeriksa palindrom
  print('Masukkan kalimat: ');
  String kalimat = stdin.readLineSync()!;
  Kalimat kalimatObj = Kalimat();
  kalimatObj.prosesKalimat(kalimat);
}

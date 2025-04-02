import 'dart:io';
import 'datapegawai.dart';

void main() {
  print('Pilih Jenis Pencarian (NIP/Nama): ');
  String jenisPencarian = stdin.readLineSync()!;

 if (jenisPencarian == 'NIP') {
  print('Masukkan NIP: ');
  int cariNip = int.parse(stdin.readLineSync()!);
  Pegawai? hasil = sequentialSearch(daftarPeg, cariNip, 'NIP');
  if (hasil !=null) {
    print('==Data pegawai ditemukan==');
    stdout.write('Nama: ${hasil.nama} \nAlamat: ${hasil.alamat} \nGolongan: ${hasil.golongan}');
   //Nama: ${hasil.nama}, Alamat: ${hasil.alamat}, Golongan: ${hasil.golongan}');
  } else {
    print('Data tidak ditemukan');
  }
 } else if (jenisPencarian== 'Nama') {
  print('Masukkan nama: ');
  String cariNama = stdin.readLineSync()!;
  Pegawai? hasil = binarySearch(daftarPeg, cariNama, 'Nama');
  if (hasil !=null) {
  print('==Data ditemukan pegawai ditemukan==');
  stdout.write('Nama: ${hasil.nama} \nNIP: ${hasil.NIP} \nAlamat: ${hasil.alamat} \nGolongan: ${hasil.golongan}');
 } else {
  print('Data tidak ditemukan');
 }
 }
}

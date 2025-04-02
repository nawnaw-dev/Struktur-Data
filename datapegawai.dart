class Pegawai {
  int NIP; 
  String nama;
  String alamat; 
  String golongan;

  Pegawai(this.NIP, this.nama, this.alamat, this.golongan);
}

List<Pegawai> daftarPeg = [
  Pegawai(1357, 'Naura', 'Pengatigan', 'A'),
  Pegawai(1234, 'Adhelia', 'Sukowidi', 'B'),
  Pegawai(1470, 'Shavira', 'Sraten', 'A'),
  Pegawai(1145, 'Naila', 'Cluring', 'B')
];

//sequential search
Pegawai? sequentialSearch(List<Pegawai> daftar, dynamic kunci, String jenisPencarian) {
  for (var pegawai in daftar) {
    if (jenisPencarian == "NIP" && pegawai.NIP == kunci) {
      return pegawai;
    } else if (jenisPencarian == "Nama" && pegawai.nama == kunci) {
      return pegawai;
    }
  }
  return null; // Data tidak ditemukan
}

//Binary search
Pegawai? binarySearch(List<Pegawai> daftar, dynamic kunci, String jenisPencarian) {
  if (jenisPencarian == "NIP") {
    daftar.sort((a, b) => a.NIP.compareTo(b.NIP));
  } else if (jenisPencarian == "Nama") {
    daftar.sort((a, b) => a.nama.compareTo(b.nama));
  }

  int awal = 0;
  int akhir = daftar.length - 1;

  while (awal <= akhir) {
    int tengah = (awal + akhir) ~/ 2;
    Pegawai pegawaiTengah = daftar[tengah];

    if (jenisPencarian == "NIP" && pegawaiTengah.NIP == kunci) {
      return pegawaiTengah;
    } else if (jenisPencarian == "Nama" && pegawaiTengah.nama == kunci) {
      return pegawaiTengah;
    } else if ((jenisPencarian == "NIP" && pegawaiTengah.NIP > kunci) ||
        (jenisPencarian == "Nama" && pegawaiTengah.nama.compareTo(kunci) > 0)) {
      akhir = tengah - 1;
    } else {
      awal = tengah + 1;
    }
  }

  return null; // Data tidak ditemukan
}

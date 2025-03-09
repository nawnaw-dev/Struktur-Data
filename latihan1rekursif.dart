import 'dart:io';

int pascalTriangle (int baris, int kolom) {
  if (kolom == 0 || kolom == baris) {
    return 1;
  } else {
    return pascalTriangle(baris - 1, kolom - 1) + pascalTriangle( baris -1, kolom);
  }
}

void segitigaPascal (int rows) {
  for (int i = 0; i < rows; i++) {
    stdout.write(' ' * (rows - i));

    for (int j = 0; j <= i; j++) {
    stdout.write('${pascalTriangle(i,j)} ');
  }
  print('');
  }
}

void main() {
  int tinggiSegitiga = 6;
  segitigaPascal(tinggiSegitiga);
}

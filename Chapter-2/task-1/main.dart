import 'dart:io';

void main() {
  bool repeat = true;

  while (repeat) {
    print("Program Hitung Luas Persegi dan Persegi Panjang");

    // Pilihan bentuk
    print("Pilih bentuk (1. Persegi, 2. Persegi Panjang, 0. Keluar): ");
    int choice = int.tryParse(stdin.readLineSync()!) ?? -1;

    if (choice == 1) {
      // Hitung luas persegi
      print("Masukkan panjang sisi persegi: ");
      double side = double.tryParse(stdin.readLineSync()!) ?? 0.0;

      double area = calculateSquareArea(side);
      print("Luas Persegi: $area");
    } else if (choice == 2) {
      // Hitung luas persegi panjang
      print("Masukkan panjang persegi panjang: ");
      double length = double.tryParse(stdin.readLineSync()!) ?? 0.0;

      print("Masukkan lebar persegi panjang: ");
      double width = double.tryParse(stdin.readLineSync()!) ?? 0.0;

      double area = calculateRectangleArea(length, width);
      print("Luas Persegi Panjang: $area");
    } else if (choice == 0) {
      print("Program selesai.");
      repeat = false;
    } else {
      print("Pilihan tidak valid. Silakan pilih lagi.");
    }

    // Jika pengguna ingin mengulangi, minta input
    if (repeat) {
      print("Pilih 1 untuk menghitung lagi, 0 untuk keluar: ");
      int continueChoice = int.tryParse(stdin.readLineSync()!) ?? -1;

      if (continueChoice != 1) {
        repeat = false;
        print("Program selesai.");
      }
    }
  }
}

// Fungsi untuk menghitung luas persegi
double calculateSquareArea(double side) {
  return side * side;
}

// Fungsi untuk menghitung luas persegi panjang
double calculateRectangleArea(double length, double width) {
  return length * width;
}

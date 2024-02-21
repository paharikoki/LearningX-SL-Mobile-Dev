import 'dart:io';

void main() {
  // Menyiapkan data siswa dan nilainya
  Map<String, int> nilaiSiswa = {
    'Agus': 90,
    'Yanto': 65,
    'Bagus': 30,
    'Yanti': 80,
    'Gunawan': 55,
    'Tutik': 75,
    'Samsudin': 95,
  };

  // Menampilkan data siswa dan status kelulusannya
  print("Data Nilai Siswa:");
  for (var entry in nilaiSiswa.entries) {
    String namaSiswa = entry.key;
    int nilai = entry.value;
    String status = cekStatusKelulusan(nilai);

    print("$namaSiswa: Nilai $nilai - Status: $status");
  }
}

// Fungsi untuk mengecek status kelulusan berdasarkan nilai
String cekStatusKelulusan(int nilai) {
  if (nilai >= 80) {
    return 'Lulus';
  } else if (nilai >= 50) {
    return 'Revisi';
  } else {
    return 'Tidak Lulus';
  }
}

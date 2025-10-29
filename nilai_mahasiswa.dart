import 'dart:io';

void main() {
  print('=== Program Pengelola Nilai Mahasiswa ===\n');

  List<Map<String, dynamic>> dataMahasiswa = [];

  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < jumlah; i++) {
    print('\nMahasiswa ke-${i + 1}');
    stdout.write('Nama: ');
    String nama = stdin.readLineSync()!;

    stdout.write('Nilai Tugas: ');
    double tugas = double.parse(stdin.readLineSync()!);

    stdout.write('Nilai UTS: ');
    double uts = double.parse(stdin.readLineSync()!);

    stdout.write('Nilai UAS: ');
    double uas = double.parse(stdin.readLineSync()!);

    double rataRata = (tugas + uts + uas) / 3;

    String keterangan = rataRata >= 60 ? 'Lulus' : 'Tidak Lulus';

    dataMahasiswa.add({
      'nama': nama,
      'tugas': tugas,
      'uts': uts,
      'uas': uas,
      'rata': rataRata,
      'status': keterangan
    });
  }

  print('\n=== Rekap Nilai Mahasiswa ===');
  print('Nama\t\tRata-rata\tStatus');
  print('------------------------------------');

  for (var mhs in dataMahasiswa) {
    print('${mhs['nama']}\t\t${mhs['rata'].toStringAsFixed(2)}\t\t${mhs['status']}');
  }

  double totalRata = dataMahasiswa.fold(0, (sum, mhs) => sum + mhs['rata']);
  double rataKelas = totalRata / dataMahasiswa.length;

  print('\nRata-rata kelas: ${rataKelas.toStringAsFixed(2)}');
}
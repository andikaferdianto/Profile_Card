// lib/profile_card.dart
import 'package:flutter/material.dart';

// Helper: ambil digit dari NIM
int digitTerakhir(String nim) => int.parse(nim[nim.length - 1]);
int digitKe2DariBelakang(String nim) => int.parse(nim[nim.length - 2]);
int duaDigitTerakhir(String nim) =>
    int.parse(nim.substring(nim.length - 2));

class ProfileCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String hobi;
  final int skorAktivitas;

  const ProfileCard({
    Key? key,
    required this.nama,
    required this.nim,
    required this.hobi,
    required this.skorAktivitas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Atribut styling dihitung dari digit NIM
    final double lebarKartu = 320.0 + (digitKe2DariBelakang(nim) * 5); // 365.0
    final double radius = 12.0 + (digitTerakhir(nim) * 1.5); // 18.0
    final double ukuranLogo = 60.0 + (digitTerakhir(nim) * 2); // 68.0
    final double jarak = 15.0 + digitTerakhir(nim); // 19.0

    return Container(
      width: lebarKartu,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                padding: const EdgeInsets.all(6),
                child: FlutterLogo(size: ukuranLogo),
              ),
              SizedBox(width: jarak),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kartu Praktikan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(nama, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),

          const Divider(thickness: 1.5),

          // Detail identitas
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NIM: $nim',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text('Hobi: $hobi',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text('Skor Aktivitas: $skorAktivitas',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
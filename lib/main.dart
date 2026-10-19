// lib/main.dart
import 'package:flutter/material.dart';
import 'profile_card.dart';

const String kNama = 'Andika Ferdianto';
const String kNim = '20240801194';
const String kHobi = 'Berenang';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool ganjil = digitTerakhir(kNim) % 2 != 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
        ganjil ? Colors.tealAccent[100] : Colors.amber[100],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int skor = duaDigitTerakhir(kNim) + 50; // 144

    return Scaffold(
      body: Center(
        child: ProfileCard(
          nama: kNama,
          nim: kNim,
          hobi: kHobi,
          skorAktivitas: skor,
        ),
      ),
    );
  }
}
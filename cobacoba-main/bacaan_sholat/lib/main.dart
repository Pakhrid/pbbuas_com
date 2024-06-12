import 'package:flutter/material.dart';
import 'package:bacaan_sholat/page/main_page.dart';
import 'package:bacaan_sholat/page/niat_sholat_page.dart';
import 'package:bacaan_sholat/page/bacaan_sholat_page.dart';
import 'package:bacaan_sholat/page/ayat_kursi_page.dart';
import 'package:bacaan_sholat/page/dzikir_page.dart';
import 'package:bacaan_sholat/page/tarawih_page.dart';
import 'package:bacaan_sholat/page/tobat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bacaan Sholat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      routes: {
        '/niatSholat': (context) => const NiatSholat(),
        '/bacaanSholat': (context) => const BacaanSholat(),
        '/ayatKursi': (context) => const AyatKursi(),
        '/dzikir': (context) => const DzikirPage(),
        '/tarawih': (context) => const TarawihPage(),
        '/tobat': (context) => const TobatPage(),
      },
    );
  }
}

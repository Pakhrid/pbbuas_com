import 'package:bacaan_sholat/page/ayat_kursi_page.dart';
import 'package:bacaan_sholat/page/bacaan_sholat_page.dart';
import 'package:bacaan_sholat/page/dzikir_page.dart';
import 'package:bacaan_sholat/page/niat_sholat_page.dart';
import 'package:bacaan_sholat/page/tarawih_page.dart';
import 'package:bacaan_sholat/page/tobat_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: [
              _buildMenuItem(
                context: context,
                imagePath: "assets/images/ic_niat.png",
                text: "Niat Sholat",
                destination: const NiatSholat(),
                backgroundColor: const Color.fromARGB(255, 255, 213, 176),
                textColor: const Color.fromARGB(255, 207, 146, 93),
              ),
              _buildMenuItem(
                context: context,
                imagePath: "assets/images/ic_doa.png",
                text: "Bacaan Sholat",
                destination: const BacaanSholat(),
                backgroundColor: const Color.fromARGB(255, 170, 227, 236),
                textColor: const Color.fromRGBO(21, 101, 192, 1),
              ),
              _buildMenuItem(
                context: context,
                imagePath: "assets/images/ic_bacaan.png",
                text: "Ayat Kursi",
                destination: const AyatKursi(),
                backgroundColor: const Color.fromRGBO(215, 204, 200, 1),
                textColor: const Color.fromARGB(255, 135, 114, 107),
              ),
              _buildMenuItem(
                context: context,
                imagePath: "assets/images/ic_dzikir.png",
                text: "Dzikir",
                destination: const DzikirPage(),
                backgroundColor: const Color.fromRGBO(225, 190, 231, 1),
                textColor: const Color.fromRGBO(106, 27, 154, 1),
              ),
              _buildMenuItem(
                context: context,
                imagePath: "assets/images/ic_tarawih.png",
                text: "Sholat Tarawih",
                destination: const TarawihPage(),
                backgroundColor: const Color.fromARGB(255, 248, 196, 113),
                textColor: const Color.fromARGB(255, 176, 123, 40),
              ),
              _buildMenuItem(
                context: context,
                imagePath: "assets/images/ic_tobat.png",
                text: "Sholat Tobat",
                destination: const TobatPage(),
                backgroundColor: const Color.fromARGB(255, 200, 230, 201),
                textColor: const Color.fromARGB(255, 56, 142, 60),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String imagePath,
    required String text,
    required Widget destination,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: imagePath,
              child: Image.asset(
                imagePath,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

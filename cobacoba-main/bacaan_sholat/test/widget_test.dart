import 'package:bacaan_sholat/page/ayat_kursi_page.dart';
import 'package:bacaan_sholat/page/niat_sholat_page.dart';
import 'package:bacaan_sholat/page/dzikir_page.dart'; 
import 'package:flutter/material.dart';

class BacaanSholat extends StatelessWidget {
  // ignore: use_super_parameters
  const BacaanSholat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bacaan Sholat'),
      ),
      body: const DzikirPage(), 
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE), 
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NiatSholat()),
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/ic_niat.png"),
                        height: 140,
                        width: 140,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Niat Sholat",
                        style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 141, 224, 215), 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BacaanSholat()),
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/ic_doa.png"),
                        height: 140,
                        width: 140,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Bacaan Sholat",
                        style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFB39DDB), // Pastel purple text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AyatKursi()),
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/ic_bacaan.png"),
                        height: 140,
                        width: 140,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Ayat Kursi",
                        style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 71, 233, 255), // Light cyan text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

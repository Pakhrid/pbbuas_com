// ignore_for_file: library_prefixes, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class TobatPage extends StatefulWidget {
  const TobatPage({super.key});

  @override
  _TobatPageState createState() => _TobatPageState();
}

class _TobatPageState extends State<TobatPage> {
  Future<List<dynamic>> readJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString('assets/data/tobat.json');
    return json.decode(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 228, 225, 1),
      appBar: AppBar(
        title: const Text('Sholat Tobat'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(255, 182, 193, 1),
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: const EdgeInsets.only(top: 120, left: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sholat Tobat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Panduan Sholat Tobat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      "assets/images/bg_tobat.png",
                      width: 280,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: FutureBuilder(
                  future: readJsonData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final data = snapshot.data as List<dynamic>;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final step = data[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(15),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent,
                                // ignore: deprecated_member_use
                                backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  step['step'].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if (step['description'] != null && step['description'].isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              step['description'],
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        if (step['arabic'] != null && step['arabic'].isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              step['arabic'],
                                              style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                                            ),
                                          ),
                                        if (step['translation'] != null && step['translation'].isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              step['translation'],
                                              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TobatPage(),
  ));
}

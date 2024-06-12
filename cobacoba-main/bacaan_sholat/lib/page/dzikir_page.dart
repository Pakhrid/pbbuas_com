import 'dart:convert';

import 'package:flutter/material.dart';

class DzikirPage extends StatefulWidget {
  // ignore: use_super_parameters
  const DzikirPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DzikirPageState createState() => _DzikirPageState();
}

class _DzikirPageState extends State<DzikirPage> {
  late Future<List<DzikirModel>> _jsonDataFuture;

  @override
  void initState() {
    super.initState();
    _jsonDataFuture = readJsonData();
  }

  Future<List<DzikirModel>> readJsonData() async {
    final jsondata =
        await DefaultAssetBundle.of(context).loadString('assets/data/dzikir.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => DzikirModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
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
                      color: const Color(0xFF757575),
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
                            "Dzikir Pagi & Petang",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Bacaan dzikir pagi dan petang",
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
                      "assets/images/bg_dzikir.png",
                      width: 280,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: _jsonDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    var items = snapshot.data as List<DzikirModel>;
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(15),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: ExpansionTile(
                              title: Text(
                                items[index].title.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(bottom: 8),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8, right: 8),
                                                child: Text(
                                                  items[index].arabic.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8, right: 8),
                                                child: Text(
                                                  items[index].translation.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DzikirModel {
  final String title;
  final String arabic;
  final String translation;

  DzikirModel({
    required this.title,
    required this.arabic,
    required this.translation,
  });

  factory DzikirModel.fromJson(Map<String, dynamic> json) {
    return DzikirModel(
      title: json['title'] as String,
      arabic: json['arabic'] as String,
      translation: json['translation'] as String,
    );
  }
}

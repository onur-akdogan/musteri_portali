import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Faturalar extends StatelessWidget {
  const Faturalar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MainPage(),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('BOTAŞ'),
            Visibility(
              visible: true,
              child: Text(
                'Müşteri Portalı -> Faturalarım',
                style: TextStyle(fontSize: 10, letterSpacing: 1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> faturalar = [];

  Future<void> veriCek() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/fatura/getMusteriFaturalar/107'));

    if (response.statusCode == 200) {
      setState(() {
        faturalar = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    veriCek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: faturalar.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Fatura Numarası: ${faturalar[index]['id']}'),
            subtitle: Text(
                'Fatura Tutarı: ' + faturalar[index]['tutar'].toString() + '₺'),
          );
        },
      ),
    );
  }
}

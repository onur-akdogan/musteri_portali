import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TMB extends StatefulWidget {
  @override
  _TMBState createState() => _TMBState();
}

class _TMBState extends State<TMB> {
  List<dynamic> faturalar = [];

  Future<void> veriCek() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/fatura/faturalar'));

    if (response.statusCode == 200) {
      setState(() {
        faturalar = json.decode(response.body);
      });
    } else {
      throw Exception('Veri çekme başarısız oldu.');
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
      appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('BOTAŞ'),
              Visibility(
                child: Text(
                  'Müşteri Portalı -> TMB Arşivi',
                  style: TextStyle(fontSize: 10.0, letterSpacing: 1),
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 210, 20, 26)),
      body: ListView.builder(
        itemCount: faturalar.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(faturalar[index]['faturaAdi']),
            subtitle: Text('Fatura ID: ${faturalar[index]['faturaID']}'),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: TMB()));

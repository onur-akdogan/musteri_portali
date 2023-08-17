import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FaturaListesi extends StatefulWidget {
  @override
  _FaturaListesiState createState() => _FaturaListesiState();
}

class _FaturaListesiState extends State<FaturaListesi> {
  List<dynamic> faturalar = [];

  Future<void> veriCek() async {
    final response =
        await http.post(Uri.parse('http://10.0.2.2:8080/fatura/faturalar'));

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
      appBar: AppBar(
        title: Text('Fatura Listesi'),
      ),
      body: ListView.builder(
        itemCount: faturalar.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Fatura ID: ${faturalar[index]['id']}'),
            subtitle: Text('' + faturalar[index]['tutar'].toString()),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: FaturaListesi()));

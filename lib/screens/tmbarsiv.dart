import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musteri_portali/core/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TMBarsivi extends StatelessWidget {
  const TMBarsivi({super.key});

  @override
  Widget build(BuildContext context) {
    return tmbArsiv();
  }
}

class tmbArsiv extends StatefulWidget {
  const tmbArsiv({super.key});

  @override
  State<tmbArsiv> createState() => _tmbArsivState();
}

class _tmbArsivState extends State<tmbArsiv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BOTAŞ',
            ),
            Visibility(
              visible: true,
              child: Text(
                'Müşteri Portalı -> TMB Arşivi',
                style: TextStyle(fontSize: 10.0, letterSpacing: 1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
      body: const Tablolama(),
    );
  }
}

class Tablolama extends StatefulWidget {
  const Tablolama({super.key});

  @override
  State<Tablolama> createState() => _TablolamaState();
}

class _TablolamaState extends State<Tablolama> {
  List<dynamic> tmbarsivi = [];

  Future<void> veriCek() async {
    final response = await http.get(Uri.parse(
      'http://10.0.2.2:8080/gerceklesen_tmb/getByMusteriId/${musteriId}',
    ));

    if (response.statusCode == 200) {
      setState(() {
        tmbarsivi.clear();
        tmbarsivi = json.decode(response.body);
        print(tmbarsivi.toString());
      });
      setState(() {});
    }
  }

  final List<String> items = List<String>.generate(10, (i) => '$i');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veriCek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0;
                  i <= tmbarsivi.length - 1;
                  i++) // Original card + 15 new cards
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                            miktar: tmbarsivi[i]['miktar'],
                            tarih: tmbarsivi[i]['tarih'],
                            teslim_noktasi: tmbarsivi[i]['istasyon']
                                ['istasyon_adi']),
                      ),
                    ),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        title: Text(
                          "Teslim Noktası:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Tüketim Tarihi:${(tmbarsivi[i]['tarih'])}",
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Icon(Icons.more_vert_sharp),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  var miktar;
  var tarih;
  var teslim_noktasi;

  DetailPage({
    required this.miktar,
    required this.tarih,
    required this.teslim_noktasi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BOTAŞ',
            ),
            Visibility(
              visible: true,
              child: Text(
                'Müşteri Portalı',
                style: TextStyle(fontSize: 10.0, letterSpacing: 1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          child: CupertinoListTile(
            title: Text(
              'Teslim Noktası:',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text(
              '$teslim_noktasi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 2, // Çizgi yüksekliği
          color: CupertinoColors.systemGrey4, // Çizgi rengi
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          child: CupertinoListTile(
            title: Text(
              'Tüketim Tarihi:',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text(
              '$tarih',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 2, // Çizgi yüksekliği
          color: CupertinoColors.systemGrey4, // Çizgi rengi
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          child: CupertinoListTile(
            title: Text(
              'Miktar:',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text(
              '$miktar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

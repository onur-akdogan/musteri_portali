import 'package:flutter/material.dart';
import 'package:musteri_portali/screens/navbar.dart';
import 'stuketiciekleme.dart';
import 'package:flutter/cupertino.dart';

void main() {
  const SerbestTuketiciBildirimi();
}

class SerbestTuketiciBildirimi extends StatelessWidget {
  const SerbestTuketiciBildirimi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: STuketiciBildirimi(),
    );
  }
}

class STuketiciBildirimi extends StatefulWidget {
  const STuketiciBildirimi({super.key});

  @override
  State<STuketiciBildirimi> createState() => _STuketiciBildirimiState();
}

class _STuketiciBildirimiState extends State<STuketiciBildirimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tablolama(),
      drawer: Navbar(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_box_outlined,
              size: 32,
            ),
            tooltip: 'Comment Icon',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => STEkleme(),
                ),
              );
            },
          ),
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BOTAŞ',
            ),
            Visibility(
              visible: true,
              child: Text(
                'Müşteri Portalı -> Serbest Tüketici Bildirimi',
                style: TextStyle(fontSize: 10.0, letterSpacing: 1),
              ),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
    );
  }
}

class Tablolama extends StatefulWidget {
  const Tablolama({super.key});

  @override
  State<Tablolama> createState() => _TablolamaState();
}

class _TablolamaState extends State<Tablolama> {
  final List<String> items = List<String>.generate(10, (i) => '$i');

  void _onCardTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(cardIndex: index),
      ),
    );
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
              for (var i = 1; i <= 16; i++) // Original card + 15 new cards
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => _onCardTapped(i),
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
                          "Müşteri Adı: $i",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Tüketim Tarihi: 01.01.2021",
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
  final int cardIndex;

  DetailPage({required this.cardIndex});

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
              'Müşteri Adı:',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text(
              '$cardIndex',
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
              'EPDK Sektörü',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text(
              '$cardIndex',
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
              'Hacim',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text(
              '$cardIndex',
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
              'İstasyon Adı:',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text(
              '$cardIndex',
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

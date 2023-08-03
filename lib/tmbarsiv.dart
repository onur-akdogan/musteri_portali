import 'package:flutter/material.dart';
import 'navbar.dart';

class TMBarsivi extends StatelessWidget {
  const TMBarsivi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tmbArsiv(),
    );
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
      drawer: Navbar(),
      appBar: AppBar(
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
      backgroundColor: Colors.deepPurple[100],
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
                      color: Colors.deepPurple[50],
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
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xff6ae792),
                          child: Text(
                            i.toString(),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        title: Text(
                          "TEST",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "TEST",
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
                'Müşteri Portalı',
                style: TextStyle(fontSize: 10.0, letterSpacing: 1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
      body: Center(
        child: Text("Tıklanan Card: $cardIndex"),
      ),
    );
  }
}

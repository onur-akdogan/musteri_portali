import 'package:flutter/material.dart';
import 'navbar.dart';

void main() {
  runApp(const TehisListesi());
}

class TehisListesi extends StatelessWidget {
  const TehisListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tehisListe(),
    );
  }
}

class tehisListe extends StatefulWidget {
  const tehisListe({super.key});

  @override
  State<tehisListe> createState() => _tehisListeState();
}

class _tehisListeState extends State<tehisListe> {
  TextEditingController _searchController = TextEditingController();
  List<String> filteredItems = List<String>.generate(16, (i) => '$i');

  void _onCardTapped(String item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(cardItem: item),
      ),
    );
  }

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
                'Müşteri Portalı -> Tehis Listesi',
                style: TextStyle(fontSize: 10.0, letterSpacing: 1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: "Arama",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var item in filteredItems)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => _onCardTapped(item),
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
                                  item,
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
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String cardItem;

  DetailPage({required this.cardItem});

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
        child: Text("Tıklanan Öğe: $cardItem"),
      ),
    );
  }
}

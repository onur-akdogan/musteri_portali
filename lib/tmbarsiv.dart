import 'package:flutter/material.dart';
import 'navbar.dart';

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
        title: Text('BOTAŞ MÜŞTERİ PORTALI'),
        backgroundColor: Color.fromARGB(255, 210, 20, 26),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
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
                      "1",
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
            )

            /* 
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Colors.amberAccent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF20283e),
                child: Text(
                  items[index],
                ),
              ),
              title: Text("data"),
              trailing: Icon(Icons.arrow_forward_ios),
            )
           */
          ],
        ),
      ),
    );
  }
}

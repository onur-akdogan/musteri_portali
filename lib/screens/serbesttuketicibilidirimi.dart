import 'package:flutter/material.dart';
import 'package:musteri_portali/screens/navbar.dart';
import 'stuketiciekleme.dart';

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
                    builder: (context) =>
                        STEkleme()), // Login sayfasına yönlendirme
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

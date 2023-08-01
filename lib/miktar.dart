import 'package:flutter/material.dart';
import 'navbar.dart';

class MiktarPage extends StatefulWidget {
  const MiktarPage({super.key});

  @override
  State<MiktarPage> createState() => _MiktarPageState();
}

class _MiktarPageState extends State<MiktarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOTAŞ MÜŞTERİ PORTALI'),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
      drawer: const Navbar(),
    );
  }
}

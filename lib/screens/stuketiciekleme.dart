import 'package:flutter/material.dart';
import 'package:musteri_portali/screens/serbesttuketicibilidirimi.dart';
import 'login_page.dart';

void main() {
  runApp(const STEkleme());
}

class STEkleme extends StatelessWidget {
  const STEkleme({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: SerbestTuketiciEkleme(),
    );
  }
}

class SerbestTuketiciEkleme extends StatefulWidget {
  const SerbestTuketiciEkleme({super.key});

  @override
  State<SerbestTuketiciEkleme> createState() => _SerbestTuketiciEklemeState();
}

class _SerbestTuketiciEklemeState extends State<SerbestTuketiciEkleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Geri dönme butonunu eklemek için AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SerbestTuketiciBildirimi()), // Login sayfasına yönlendirme
            );
          },
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
              ),
              //const SizedBox(height: 30),
              const Text(
                'BOTAŞ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  fontFamily: 'poppins',
                ),
              ),
              const Text(
                'MÜŞTERİ PORTALI',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'poppins',
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Müşteri Numaranız',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: InkWell(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Şifre Sıfırlama Talep Et',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

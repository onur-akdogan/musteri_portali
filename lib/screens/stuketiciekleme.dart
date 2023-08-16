import 'package:flutter/material.dart';
import 'package:musteri_portali/screens/serbesttuketicibilidirimi.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SerbestTuketiciBildirimi()),
            );
          },
          color: Color.fromARGB(255, 10, 10, 10),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Ekranın klavye ile kaymasını sağlayan widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
              Text(
                'ST Müşteri Kodu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ST Müşteri Kodu',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'ST Adı',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ST Adı',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'EPDK Sektörü',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'EPDK Sektörü',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'İstasyon Adı',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'İstasyon Adı',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Hacim',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Hacim',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ), // Klavye açıldığında kayma
              SizedBox(height: 16), // Ekstra boşluk ekledik
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0), // Yatay kenarlardan padding'i kaldırıyoruz
                child: InkWell(
                  onTap: null,
                  child: Container(
                    width: double
                        .infinity, // Container'ın tam genişlikte olmasını sağlar
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Kaydet',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

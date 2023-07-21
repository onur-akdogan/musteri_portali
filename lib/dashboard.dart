import 'package:flutter/material.dart';
import 'navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('BOTAŞ MÜŞTERİ PORTALI'),
        backgroundColor: Color.fromARGB(255, 210, 20, 26),
      ),
      body: CarouselPage(),
    );
  }
}

class CarouselPage extends StatelessWidget {
  // Metin listesi
  final List<String> textList = [
    'Metin 1',
    'Metin 2',
    'Metin 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          itemCount: textList.length,
          options: CarouselOptions(
            height: 200, // Carousel yüksekliği
            enlargeCenterPage: true, // Merkezdeki resmi büyütme
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueGrey)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    textList[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

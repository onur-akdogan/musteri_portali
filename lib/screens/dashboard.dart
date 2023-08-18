import 'package:flutter/material.dart';
import 'navbar.dart';
import 'package:musteri_portali/core/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:musteri_portali/future/future.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int musteriId = 0;
  @override
  void initState() {
    super.initState();
    _getMusteriId();
  }

  Future<void> _getMusteriId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      musteriId = prefs.getInt('musteriId') ?? 0; // Varsayılan değer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: Text('BOTAŞ MÜŞTERİ PORTALI' + musteriId.toString()),
        backgroundColor: const Color.fromARGB(255, 210, 20, 26),
      ),
      body: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 135,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Toplam Tutar',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '123,123,456 sm3',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              height: 135,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Toplam Tüketim',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '123,123,456 sm3',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              height: 135,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'YSM Miktarı',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '123,123,456 sm3',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              height: 135,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'YSM Miktarı',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '123,123,456 sm3',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

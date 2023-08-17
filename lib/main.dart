import 'package:flutter/material.dart';
import 'package:musteri_portali/screens/login_page.dart'; // login_page.dart dosyanızı eklediğinizi varsayalım

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Açılış Ekranı Örneği',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Açılış ekranını göster
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simüle edilen gecikme süresi
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // Açılış ekranı tamamlandığında PreloaderScreen'a yönlendir
        context,
        MaterialPageRoute(builder: (context) => PreloaderScreen()),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover, // Arkaplanı doldur
          ),
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 200, // Logo genişliği
              height: 200, // Logo yüksekliği
            ),
          ),
        ],
      ),
    );
  }
}

class PreloaderScreen extends StatefulWidget {
  @override
  _PreloaderScreenState createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  @override
  void initState() {
    super.initState();
    // Simüle edilen gecikme süresi
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // Preloader süresi tamamlandığında LoginPage'a yönlendir
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 210, 20, 26)), // Preloader rengi
        ),
      ),
    );
  }
}
//post->insert
//get->select
//put->update
//delete->delete 
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _kullaniciAdi = TextEditingController();
  final TextEditingController _sifre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //resim gelecek
              Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30),
              Text(
                'BOTAŞ MÜŞTERİ PORTALI',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'poppins'),
              ),
              SizedBox(height: 10),
              Text(
                'MOBİL UYGULAMASI',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'poppins'),
              ),
              SizedBox(height: 30),
              //Kullanıcı Adı Bölümü

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: _kullaniciAdi,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Kullanıcı Adı',
                      ),
                    ),
                  ),
                ),
              ),
              //Şifre Bölümü
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: _sifre,
                      obscureText: true, //Şifre gizleme
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Şifre',
                      ),
                    ),
                  ),
                ),
              ),
              //Giriş Butonu
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),  
                child: InkWell(
                  onTap: _login,
                  child: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Şifrenizi mi unuttunuz?',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: 'poppins')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    String username = 'burak';
    String password = '123456';

    if (_kullaniciAdi.text == username && _sifre.text == password) {
      // Kullanıcı adı ve şifre doğruysa Dashboard sayfasına yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // Kullanıcı adı ve şifre yanlışsa hata mesajı göster
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Giriş Yapılamadı'),
            content: Text('Kullanıcı Adı veya Şifre Yanlış.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }
}

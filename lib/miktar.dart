import 'package:flutter/material.dart';
import 'navbar.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
//ListTile İçine Al
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BOTAŞ',
              //style: TextStyle(fontSize: 81),
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.check_box_outlined),
            label: 'Gerçekleşen',
          ),
          NavigationDestination(
            icon: Icon(Icons.access_time_outlined),
            label: 'Tahmini',
          ),
          NavigationDestination(
            icon: Icon(Icons.change_circle_outlined),
            label: 'Değişiklik Bildirim',
          ),
        ],
      ),
      body: <Widget>[
        //Gerçekleşen Tüketim
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Gerçekleşen Tüketim',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Tüketim miktarlarınızı görebilirsiniz',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16), // Boşluk eklemek için SizedBox
                // Dropdown Menü
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      child: Text('Ankara'),
                      value: 'Ankara',
                    ),
                    DropdownMenuItem(
                      child: Text('İstanbul'),
                      value: 'İstanbul',
                    ),
                    DropdownMenuItem(
                      child: Text('Bolu'),
                      value: 'Bolu',
                    ),
                    DropdownMenuItem(
                      child: Text('Mersin'),
                      value: 'Mersin',
                    ),
                    DropdownMenuItem(
                      child: Text('Kayseri'),
                      value: 'Kayseri',
                    ),
                  ],
                  onChanged: (selectedStation) {},
                  hint:
                      const Text('İstasyon Seçin'), // Başlangıçta görünen metin
                  isExpanded: true, // Menünün genişlemesini sağlar
                ),
                const SizedBox(height: 16), // Boşluk eklemek için SizedBox
                // 3 tane radio buton
                Row(
                  children: [
                    Radio(
                      value: 'ST',
                      groupValue: 'radioGroup',
                      onChanged: (value) {
                        // Seçilen değeri almak için bir fonksiyon
                        // Burada seçilen radio buton değerini kullanabilirsiniz.
                      },
                    ),
                    Text('ST'),
                    Radio(
                      value: 'ABN',
                      groupValue: 'radioGroup',
                      onChanged: (value) {
                        // Seçilen değeri almak için bir fonksiyon
                        // Burada seçilen radio buton değerini kullanabilirsiniz.
                      },
                    ),
                    const Text('ABN'),
                    Radio(
                      value: 'ELK',
                      groupValue: 'radioGroup',
                      onChanged: (value) {
                        // Seçilen değeri almak için bir fonksiyon
                        // Burada seçilen radio buton değerini kullanabilirsiniz.
                      },
                    ),
                    const Text('ELK'),
                  ],
                ),
                const SizedBox(height: 16), // Boşluk eklemek için SizedBox
                // Tarih Seçme Ekranı
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40)),
                  onPressed: () {
                    // Tarih seçiciyi açmak için bir fonksiyon çağırabilirsiniz.
                  },
                  child: const Text(
                    'Tarih Seçin',
                    style: TextStyle(fontFamily: 'poppins'),
                  ),
                ),
                const SizedBox(height: 16), // Boşluk eklemek için SizedBox
                // Tarih Yazacak
                const Text(
                  'Seçilen Tarih: 31 Ağustos 2023', // Örnek tarih, seçilen tarih ile değiştirilecek
                  style: TextStyle(fontSize: 16, fontFamily: 'poppins'),
                ),
                const SizedBox(height: 32), // Boşluk eklemek için SizedBox
                const Text(
                  'Gerçekleşen Miktar',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Gerçekleşen Miktar',
                  ),
                ),
                const SizedBox(height: 16), // Boşluk eklemek için SizedBox
                // 'Miktar Girişi Kaydet' butonu
                ElevatedButton(
                  onPressed: () {
                    _showMessage(
                        context); // Butona tıklandığında bir işlem yapmak için bir fonksiyon çağırabilirsiniz.
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Kırmızı renk
                      minimumSize: Size(double.infinity, 40)),
                  child: const Text('Miktar Girişi Kaydet'),
                ),
              ],
            ),
          ),
        ),
        Container(),
        Container(),
      ][currentPageIndex],
    );
  }

  void _showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Miktar kayıt edildi'),
        duration: Duration(
            seconds: 2), // Mesajın ekranda kalma süresi (saniye cinsinden)
      ),
    );
  }
}

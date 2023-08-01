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
  DateTime? selectedDate; // Seçilen tarihi saklayacak değişken

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
      body: SingleChildScrollView(
        // Sayfayı kaydırılabilir yapar
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Gerçekleşen Tüketim',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Tüketim miktarlarınızı görebilirsiniz',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 16), // Boşluk eklemek için SizedBox
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
                      hint: Text('İstasyon Seçin'), // Başlangıçta görünen metin
                      isExpanded: true, // Menünün genişlemesini sağlar
                    ),
                    SizedBox(height: 16), // Boşluk eklemek için SizedBox
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
                        Text('ABN'),
                        Radio(
                          value: 'ELK',
                          groupValue: 'radioGroup',
                          onChanged: (value) {
                            // Seçilen değeri almak için bir fonksiyon
                            // Burada seçilen radio buton değerini kullanabilirsiniz.
                          },
                        ),
                        Text('ELK'),
                      ],
                    ),
                    SizedBox(height: 16), // Boşluk eklemek için SizedBox
                    // Tarih Seçme Ekranı
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(
                        'Tarih Seçin',
                        style: TextStyle(fontFamily: 'poppins'),
                      ),
                    ),
                    SizedBox(height: 16), // Boşluk eklemek için SizedBox
                    // Tarih Yazacak
                    Text(
                      'Seçilen Tarih: 31 Ağustos 2023', // Örnek tarih, seçilen tarih ile değiştirilecek
                      style: TextStyle(fontSize: 16, fontFamily: 'poppins'),
                    ),
                    SizedBox(height: 32), // Boşluk eklemek için SizedBox
                    Text(
                      'Gerçekleşen Miktar',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Gerçekleşen Miktar',
                      ),
                    ),
                    SizedBox(height: 16), // Boşluk eklemek için SizedBox
                    // 'Miktar Girişi Kaydet' butonu
                    ElevatedButton(
                      onPressed: () {
                        _showMessage(
                            context); // Butona tıklandığında bir işlem yapmak için bir fonksiyon çağırabilirsiniz.
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Kırmızı renk
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Text('Miktar Girişi Kaydet'),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Miktar kayıt edildi'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 10)),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      // Seçilen tarih değiştirildiyse setState ile yeniden oluşturuyoruz
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

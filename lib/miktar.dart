import 'package:flutter/material.dart';
import 'navbar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  // Seçilen tarihi tutmak için değişken

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
        child: <Widget>[
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Tüketim miktarlarınızı görebilirsiniz',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                    hint: const Text(
                        'İstasyon Seçin'), // Başlangıçta görünen metin
                    isExpanded: true, // Menünün genişlemesini sağlar
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2099), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.tr);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.calendar_today), // Tarih seçici simgesi
                        SizedBox(width: 8), // Simge ile metin arasında boşluk
                        Text(
                          'Tarih Seçin',
                          style: TextStyle(fontFamily: 'poppins'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showMessage(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(double.infinity, 40)),
                    child: const Text('Miktar Girişi Kaydet'),
                  ),
                ],
              ),
            ),
          ),
          //Tahmini Tüketim
          Container(),
          Container(),
        ][currentPageIndex],
      ),
    );
  }
}

void _showMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Miktar kayıt edildi'),
      duration: Duration(seconds: 2),
    ),
  );
}

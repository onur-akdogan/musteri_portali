import 'package:flutter/material.dart';
import 'navbar.dart';

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
  DateTime _selectedDate = DateTime.now();
  void _gerceklesenDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 10),
        lastDate: DateTime(2099));
  }

  void _tahminiDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: /*DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + -1),*/
          DateTime.now(),
      /*lastDate: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 10));*/
      lastDate: DateTime.now().add(Duration(days: 10)),
    );
  }

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
                      _gerceklesenDatePicker();
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
                      _showMessageGerceklesen(context);
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
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  ListTile(
                    title: const Text(
                      'Tahmini Tüketim',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      '10 gün içinde gerçekleşecek olan tahmini tüketimi giriniz',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 28),
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
                      _gerceklesenDatePicker();
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
                      _showMessageGerceklesen(context);
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
          //Değişiklik Bildirim
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  const ListTile(
                    title: Text(
                      'Değişiklik Bildirimi',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Değişiklik Yapmak İstediğiniz Günü Seçiniz',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                    onPressed: () {
                      _gerceklesenDatePicker();
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
                  const SizedBox(height: 28),
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
                      const Text('ST'),
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
                  const SizedBox(height: 16),
                  const Text(
                    'Yeni Değer',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    'VT Gelen Değer',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Yeni Değer',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showMessageGerceklesen(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(double.infinity, 40)),
                    child: const Text('Değişikliği Kaydet'),
                  ),
                ],
              ),
            ),
          ),
        ][currentPageIndex],
      ),
    );
  }
}

void _showMessageGerceklesen(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Miktar kayıt edildi'),
      duration: Duration(seconds: 2),
    ),
  );
}

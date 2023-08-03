import 'package:flutter/material.dart';
import 'package:musteri_portali/miktar.dart';
import 'package:musteri_portali/tehislistesi.dart';
import 'login_page.dart';
import 'tmbarsiv.dart';
import 'dashboard.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});
  // ignore: constant_identifier_names
  static const IconData bar_chart =
      IconData(0xe0cc, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Burak'),
            accountEmail: const Text('info@botas.gov.tr'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                    //'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                    'assets/logo.png',
                    height: 250,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitWidth),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 228, 148, 150),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Anasayfa',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'TMB',
              style: TextStyle(
                fontFamily: ('poppins'),
                fontSize: 18,
              ),
            ),
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Miktar Girişi'),
                onTap: /* null */ () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationBarApp()),
                  );
                },
              ),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text('TMB Arşivi'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TMBarsivi()),
                    );
                  }),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('TMB Grafiği'),
                onTap: null,
              ),
            ],
          ),
          //Sözleşme Navbar
          ExpansionTile(
            leading: Icon(Icons.border_color),
            title: Text(
              'Sözleşme',
              style: TextStyle(
                fontFamily: ('poppins'),
                fontSize: 18,
              ),
            ),
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('DGASS'),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Tehis Listesi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TehisListesi()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Tahis Listesi'),
                onTap: null,
              ),
            ],
          ),
          const ExpansionTile(
            leading: Icon(Icons.newspaper),
            title: Text(
              'Fatura',
              style: TextStyle(
                fontFamily: ('poppins'),
                fontSize: 18,
              ),
            ),
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Revize Faturalar'),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Doğal Gaz Tüketim Faturalama'),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Serbest Tüketici Tanımlama'),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Aylık Tüketim Kırılımı'),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('SKB Faturaları'),
                onTap: null,
              ),
            ],
          ),
          const ExpansionTile(
            leading: Icon(Icons.data_saver_on),
            title: Text(
              'Veri',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 18,
              ),
            ),
            children: [
              ListTile(
                leading: Icon(Icons.abc_rounded),
                title: Text("Hane Bildirim"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.abc_outlined),
                title: Text('Bağımsız Birim Sayıları'),
                onTap: null,
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Çıkış',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

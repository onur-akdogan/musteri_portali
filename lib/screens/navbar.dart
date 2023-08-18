import 'package:flutter/material.dart';
import 'package:musteri_portali/screens/faturalar.dart';
import 'package:musteri_portali/screens/miktar.dart';
import 'tehislistesi.dart';
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
            leading: const Icon(Icons.home),
            title: const Text(
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
            leading: const Icon(Icons.assignment_outlined),
            title: const Text(
              'TMB',
              style: TextStyle(
                fontFamily: ('poppins'),
                fontSize: 18,
              ),
            ),
            children: [
              ListTile(
                leading: const Icon(Icons.assignment_outlined),
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
                  leading: Icon(Icons.assignment_outlined),
                  title: Text('TMB Arşivi'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TMBarsivi()),
                    );
                  }),
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
                leading: Icon(Icons.border_color),
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
                leading: Icon(Icons.border_color),
                title: Text('Tahis Listesi'),
                onTap: null,
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text(
              'Fatura',
              style: TextStyle(
                fontFamily: ('poppins'),
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Faturalar()),
              );
            },
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

import 'package:coba/berita_page.dart';
import 'package:coba/kontak_page.dart';
import 'package:coba/layanan_page.dart';
import 'package:coba/notifikasi_page.dart';
import 'package:coba/profil_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentScreen = 0;

  var list_page = [
    LayananPage(),
    NotifikasiPage(),
    BeritaPage(),
    KontakPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.work),label: 'Layanan'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline),label: 'Berita'),
          BottomNavigationBarItem(icon: Icon(Icons.headset_mic_outlined),label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profil'),
        ],
        currentIndex: currentScreen,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index){
          setState(() {
            currentScreen = index;
          });
        },
      ),
      body: list_page[currentScreen],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/jadwal_obat.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/tambah_obat.dart';
import 'package:flutter_application_1/register_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartPill',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(), // Tambahkan ini
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegisterScreen(),
        '/tambah-obat': (context) => const TambahObatPage(),
        '/jadwal-obat': (context) => const JadwalObatPage(),
      },
    );
  }
}
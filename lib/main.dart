import 'package:flutter/material.dart';
import 'package:tokokita/ui/login_page.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/ui/registrasi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Sesuaikan tema aplikasi
      ),
      home: const LoginPage(), // Halaman pertama adalah login
      routes: {
        '/login': (context) => const LoginPage(),
        '/registrasi': (context) => const RegistrasiPage(),
        '/produk': (context) => const ProdukPage(),
      },
    );
  }
}

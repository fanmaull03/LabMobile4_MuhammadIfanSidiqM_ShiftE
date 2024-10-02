import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tokokita/ui/login_page.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _namaTextField(),
                _emailTextField(),
                _passwordTextField(),
                _passwordKonfirmasiTextField(),
                _buttonRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Membuat Textbox Nama
  Widget _namaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama"),
      keyboardType: TextInputType.text,
      controller: _namaTextboxController,
      validator: (value) {
        if (value!.length < 3) {
          return "Nama harus diisi minimal 3 karakter";
        }
        return null;
      },
    );
  }

  // Membuat Textbox email
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        // validasi harus diisi
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }
        // validasi email
        Pattern pattern =
            r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return "Email tidak valid";
        }
        return null;
      },
    );
  }

  // Membuat Textbox password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        // jika karakter yang dimasukkan kurang dari 6 karakter
        if (value!.length < 6) {
          return "Password harus diisi minimal 6 karakter";
        }
        return null;
      },
    );
  }

  // Membuat textbox Konfirmasi Password
  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Konfirmasi Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        // jika inputan tidak sama dengan password
        if (value != _passwordTextboxController.text) {
          return "Konfirmasi Password tidak sama";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Registrasi
  Widget _buttonRegistrasi() {
    return ElevatedButton(
      child: const Text("Registrasi"),
      onPressed: () async {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          // Jika validasi berhasil, lakukan aksi (misalnya, simpan data)
          _saveData();

          // Tambahkan aksi lainnya di sini, seperti mengirim data ke server
          _sendDataToServer();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registrasi berhasil!")),
          );
          // Navigasi ke halaman Login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      },
    );
  }

  // Simpan data registrasi ke SharedPreferences
  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', _namaTextboxController.text);
    await prefs.setString('email', _emailTextboxController.text);
    await prefs.setString('password', _passwordTextboxController.text);
  }

  // Contoh fungsi mengirim data ke server
  Future<void> _sendDataToServer() async {
    String apiUrl = "https://example.com/register"; // URL API endpoint
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'nama': _namaTextboxController.text,
          'email': _emailTextboxController.text,
          'password': _passwordTextboxController.text,
        },
      );
      if (response.statusCode == 200) {
        // Proses berhasil
        print("Data berhasil dikirim ke server");
      } else {
        // Gagal
        print("Terjadi kesalahan: ${response.statusCode}");
      }
    } catch (e) {
      print("Error saat mengirim data: $e");
    }
  }
}

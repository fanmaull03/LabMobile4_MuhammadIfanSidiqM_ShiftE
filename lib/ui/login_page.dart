import 'package:flutter/material.dart';
import 'package:tokokita/ui/registrasi_page.dart';
import 'package:tokokita/ui/produk_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  // Dummy credentials untuk proses login
  final String correctEmail = "admin@example.com";
  final String correctPassword = "password123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _emailTextField(),
                _passwordTextField(),
                _buttonLogin(),
                const SizedBox(height: 30),
                _menuRegistrasi(),
              ],
            ),
          ),
        ),
      ),
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
        // Validasi format email dengan RegExp
        String pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
        RegExp regExp = RegExp(pattern);
        if (!regExp.hasMatch(value)) {
          return 'Format email tidak valid';
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
        if (value!.isEmpty) {
          return "Password harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Login
  Widget _buttonLogin() {
    return ElevatedButton(
      child: _isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text("Login"),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Logika untuk proses login
          setState(() {
            _isLoading = true;
          });

          // Simulasi proses login dengan delay
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              _isLoading = false;
            });

            // Cek apakah email dan password benar
            if (_emailTextboxController.text == correctEmail &&
                _passwordTextboxController.text == correctPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login berhasil!")),
              );

              // Navigasi ke halaman Produk
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProdukPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Email atau password salah")),
              );
            }
          });
        }
      },
    );
  }

  // Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegistrasiPage()),
          );
        },
      ),
    );
  }
}

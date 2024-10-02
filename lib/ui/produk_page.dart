import 'package:flutter/material.dart';
import 'dart:convert'; // Import untuk mengubah objek ke JSON
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  List<Produk> _listProduk = [];

  @override
  void initState() {
    super.initState();
    _loadProduk();
  }

  // Fungsi untuk memuat data produk dari SharedPreferences
  void _loadProduk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? produkData = prefs.getString('produk_list');
    if (produkData != null) {
      setState(() {
        List decodedList = jsonDecode(produkData);
        _listProduk = decodedList.map((e) => Produk.fromJson(e)).toList();
      });
    }
  }

  // Fungsi untuk menyimpan data produk ke SharedPreferences
  void _saveProduk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedList =
        jsonEncode(_listProduk.map((e) => e.toJson()).toList());
    await prefs.setString('produk_list', encodedList);
  }

  // Fungsi untuk menghapus produk
  void _hapusProduk(int id) {
    setState(() {
      _listProduk.removeWhere((produk) => produk.id == id);
      _saveProduk(); // Simpan setelah data dihapus
    });
  }

  // Fungsi untuk mengupdate produk setelah di-edit
  void _updateProduk(Produk produkDiedit) {
    setState(() {
      int index = _listProduk.indexWhere((p) => p.id == produkDiedit.id);
      if (index != -1) {
        _listProduk[index] = produkDiedit;
        _saveProduk(); // Simpan perubahan setelah di-update
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                final produkBaru = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProdukForm()),
                );

                if (produkBaru != null && produkBaru is Produk) {
                  setState(() {
                    _listProduk.add(produkBaru);
                    _saveProduk(); // Simpan produk setelah ditambah
                  });
                }
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (Route<dynamic> route) => false);
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _listProduk.length,
        itemBuilder: (context, index) {
          return ItemProduk(
            produk: _listProduk[index],
            hapusProduk: _hapusProduk,
            updateProduk: _updateProduk, // Tambahkan fungsi update produk
          );
        },
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  final Function(int) hapusProduk; // Fungsi untuk hapus produk
  final Function(Produk) updateProduk; // Fungsi untuk update produk

  const ItemProduk(
      {Key? key,
      required this.produk,
      required this.hapusProduk,
      required this.updateProduk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              produk: produk,
              hapusProduk: hapusProduk, // Pass fungsi hapus
              updateProduk: updateProduk, // Pass fungsi update produk
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
    );
  }
}

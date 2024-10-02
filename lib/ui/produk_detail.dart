import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  final Produk produk;
  final Function(int) hapusProduk; // Fungsi hapus produk
  final Function(Produk) updateProduk; // Fungsi update produk

  ProdukDetail(
      {Key? key,
      required this.produk,
      required this.hapusProduk,
      required this.updateProduk})
      : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk.kodeProduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk.namaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk.hargaProduk.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(
                  produk: widget.produk,
                ),
              ),
            ).then((value) {
              if (value != null && value is Produk) {
                setState(() {
                  widget.produk.kodeProduk = value.kodeProduk;
                  widget.produk.namaProduk = value.namaProduk;
                  widget.produk.hargaProduk = value.hargaProduk;
                });
                widget.updateProduk(
                    widget.produk); // Update produk di produk page
              }
            });
          },
        ),
        // Tombol Hapus
        OutlinedButton(
          child: const Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        // Tombol Hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            widget.hapusProduk(widget.produk.id!);
            Navigator.pop(context); // Tutup dialog
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        // Tombol Batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}

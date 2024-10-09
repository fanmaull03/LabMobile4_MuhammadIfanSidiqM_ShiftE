# Penjelasan Kode

<b> 1. Proses Login </b> <br>
<br>
        a. Screenshot form dan isi form <br>
        <img src="https://github.com/user-attachments/assets/a921beef-5237-42b4-8c38-d1fe8d37d082" width="250">
        <br>
        Tampilan di atas menunjukkan sebuah halaman registrasi aplikasi web. Berikut penjelasannya:

Judul Halaman: Di bagian atas, terdapat tulisan "Registrasi," yang menandakan bahwa pengguna sedang berada pada halaman untuk mendaftar atau membuat akun baru.

Form Input:

Nama: Ada kolom input untuk mengisi nama lengkap pengguna, yang sudah terisi dengan nama "ivan." <br>
Email: Kolom input untuk email, yang sudah terisi dengan "ivan@gmail.com." <br>
Password: Kolom input untuk kata sandi, yang sudah disembunyikan dengan tanda titik (•••••). <br>
Konfirmasi Password: Kolom input untuk mengonfirmasi kata sandi, yang juga disembunyikan dengan tanda titik. <br>
Tombol Registrasi: Di bawah kolom konfirmasi password, ada tombol dengan tulisan "Registrasi" yang memungkinkan pengguna untuk mengirimkan data formulir untuk proses pendaftaran. <br>
<br>
      b. Screenshot PopUp Berhasil/Tidak <br>
      <img src="https://github.com/user-attachments/assets/f7c7b555-3eba-4d4c-a280-98f0ff520b0c" width="250"> <br>
      <br>
      Kodenya: <br>
      import 'package:flutter/material.dart';

class Consts {
  Consts._();
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class SuccessDialog extends StatelessWidget {
  final String? description;
  final VoidCallback? okClick;
  const SuccessDialog({Key? key, this.description, this.okClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Consts.padding,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: const EdgeInsets.only(top: Consts.avatarRadius),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "SUKSES",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.green),
          ),
          const SizedBox(height: 16.0),
          Text(
            description!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
                okClick!();
              },
              child: const Text("OK"),
            ),
          )
        ],
      ),
    );
  }
}
<br>
<br>
      Tampilan di atas menggambarkan sebuah dialog SuccessDialog yang muncul setelah pengguna berhasil melakukan registrasi. Berikut adalah penjelasan berdasarkan tampilan dan kodenya:

Dialog: Dialog ini muncul di layar dengan bentuk berbentuk kotak dengan sudut yang membulat. Ini dibuat dengan menggunakan Dialog dari Flutter dan menggunakan parameter RoundedRectangleBorder untuk menambah estetika pada sudut-sudutnya.

Konten Dialog:

Di dalam dialog, terdapat teks besar "SUKSES" yang menandakan bahwa registrasi berhasil. Teks ini menggunakan warna hijau, ukuran font 24, dan ketebalan font yang kuat (FontWeight.w700).
Teks kedua adalah "Registrasi berhasil, silahkan login" yang menjelaskan tindakan berikutnya kepada pengguna. Teks ini berada di bawah judul dan ditampilkan di tengah dengan ukuran font 16.
Tombol OK:

Tombol dengan label "OK" berada di bagian bawah kanan dialog, yang ketika ditekan akan menutup dialog dan memanggil okClick, yang bisa dipakai untuk mengeksekusi aksi selanjutnya, seperti mengarahkan pengguna ke halaman login atau ke halaman lain.
Desain dan Penataan:

padding digunakan untuk memberikan ruang di sekeliling elemen dalam dialog, dan ada boxShadow yang memberikan efek bayangan lembut di bawah dialog untuk menambah kesan visual yang lebih baik.
margin pada dialog membuatnya tampak lebih menjauh dari tepi layar, memberikan ruang kosong agar dialog tidak terasa terlalu rapat.
<br>
<br>

 c. halaman login <br>
    <img src="https://github.com/user-attachments/assets/9b48a70d-73d2-4760-beb8-6ad0f2877e69" width="250"> <br>

Tampilan di atas menunjukkan sebuah halaman login pada aplikasi web. Berikut adalah penjelasan lebih lanjut:

Judul Halaman: Di bagian atas terdapat tulisan "Login" yang menandakan bahwa pengguna berada pada halaman login aplikasi.

Form Input:

Email: Terdapat kolom input untuk email pengguna yang sudah terisi dengan "ivan@gmail.com."
Password: Kolom input untuk password, yang disembunyikan dengan titik-titik (•••••).
Tombol Login:

Di bawah kolom password, terdapat tombol "Login" yang memungkinkan pengguna untuk mengirimkan data login dan memverifikasi kredensial.
Link Registrasi:

Di bagian bawah halaman terdapat sebuah link dengan tulisan "Registrasi" yang mengarahkan pengguna ke halaman pendaftaran jika mereka belum memiliki akun.

<br>
<br>

<b> 2. HomePage </b>

a. List Produk <br>
        <img src="https://github.com/user-attachments/assets/7109412c-df1d-40d1-ae48-7b4c9db4a4c5" width="250">
        <br>
        <br>
        Kodenya: <br>
        
import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/bloc/logout_bloc.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/login_page.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProdukForm()));
                },
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false)
                    });
              },
            )
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final List? list;
  const ListProduk({Key? key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemProduk(
            produk: list![i],
          );
        });
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  const ItemProduk({Key? key, required this.produk}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      produk: produk,
                    )));
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
<br>
<br>

Tampilan dari screenshot menampilkan daftar produk dengan beberapa fitur sebagai berikut:

AppBar:

Judul: Di bagian atas aplikasi terdapat AppBar dengan judul "List Produk".
Tombol Tambah: Di sebelah kanan AppBar, ada ikon tambah (add) berbentuk ikon +. Ketika ikon ini diklik, aplikasi akan membuka halaman ProdukForm untuk menambah produk baru.
Drawer (Menu Samping):

ListTile dengan judul "Logout" dan ikon logout. Jika menu ini ditekan, aplikasi akan melakukan logout dan mengarahkan pengguna ke halaman LoginPage. <br>

Body:

FutureBuilder digunakan untuk mengambil data produk dengan memanggil metode ProdukBloc.getProduks().
Jika data produk tersedia (snapshot.hasData), maka data produk akan ditampilkan dalam bentuk daftar.
Jika data belum tersedia atau masih memuat, aplikasi akan menampilkan loading indicator berupa CircularProgressIndicator.
List Produk:

ListProduk adalah widget yang menampilkan daftar produk dalam bentuk ListView.builder. Setiap item produk akan ditampilkan menggunakan widget ItemProduk.
ItemProduk adalah item individual dalam daftar, yang menampilkan nama dan harga produk.
Detail Produk:

Setiap item produk (ItemProduk) bisa ditekan. Ketika ditekan, aplikasi akan membuka halaman ProdukDetail dan menampilkan informasi detail produk yang dipilih.

<br>

b. Tambah Produk <br>
<img src="https://github.com/user-attachments/assets/4de27e1d-44e9-457d-a2b9-4e8c2b6e8a57" width="250">
<img src="https://github.com/user-attachments/assets/937d35f9-fcbc-4da4-b818-eee930462d7d" width="250"> 
<br> <br>

Kodenya: <br> 
import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/widget/warning_dialog.dart';

// ignore: must_be_immutable
class ProdukForm extends StatefulWidget {
  Produk? produk;
  ProdukForm({Key? key, this.produk}) : super(key: key);
  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH PRODUK";
  String tombolSubmit = "SIMPAN";
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();
  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk!;
        _namaProdukTextboxController.text = widget.produk!.namaProduk!;
        _hargaProdukTextboxController.text =
            widget.produk!.hargaProduk.toString();
      });
    } else {
      judul = "TAMBAH PRODUK";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

//Membuat Textbox Kode Produk
  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Textbox Nama Produk
  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Textbox Harga Produk
  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.produk != null) {
//kondisi update produk
                ubah();
              } else {
//kondisi tambah produk
                simpan();
              }
            }
          }
        });
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Produk createProduk = Produk(id: null);
    createProduk.kodeProduk = _kodeProdukTextboxController.text;
    createProduk.namaProduk = _namaProdukTextboxController.text;
    createProduk.hargaProduk = int.parse(_hargaProdukTextboxController.text);
    ProdukBloc.addProduk(produk: createProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Produk updateProduk = Produk(id: widget.produk!.id!);
    updateProduk.kodeProduk = _kodeProdukTextboxController.text;
    updateProduk.namaProduk = _namaProdukTextboxController.text;
    updateProduk.hargaProduk = int.parse(_hargaProdukTextboxController.text);
    ProdukBloc.updateProduk(produk: updateProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
} <br>

Penjelasan: <br>
Halaman ini menampilkan form dengan tiga input teks (kode produk, nama produk, harga produk) dan satu tombol untuk menyimpan atau mengubah produk. <br>
Inputan: Pengguna akan mengisi form untuk produk baru yang ingin ditambahkan. <br>
Tombol Simpan/Ubah: Tombol ini berada di bagian bawah form untuk mengirim data yang dimasukkan lalu akan ditampilkan di halaman List Produk dan akan kembali ke halaman detail produk setelah menekan tombol simpan. <br>
Dialog Peringatan: Jika terjadi kesalahan, pengguna akan melihat dialog peringatan yang menginformasikan kegagalan simpan produk. <br>
<br>

3. Produk Detail <br>
   <img src="https://github.com/user-attachments/assets/03ca3408-c38c-438a-84c4-a29167f50caf" width="250"> <br>

Kodenya : <br>

import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/widget/warning_dialog.dart';

// ignore: must_be_immutable
class ProdukDetail extends StatefulWidget {
  Produk? produk;
  ProdukDetail({Key? key, this.produk}) : super(key: key);
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
              "Kode : ${widget.produk!.kodeProduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
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
                  produk: widget.produk!,
                ),
              ),
            );
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
//tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            ProdukBloc.deleteProduk(id: int.parse(widget.produk!.id!)).then(
                (value) => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProdukPage()))
                    }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                        description: "Hapus gagal, silahkan coba lagi",
                      ));
            });
          },
        ),
//tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
<br>
<br>

Penjelasan : <br>

1. Scaffold dan AppBar:
AppBar: Halaman ini memiliki AppBar dengan judul "Detail Produk". Ini menandakan bahwa halaman ini khusus menampilkan detail dari produk tertentu. <br>
2. Tampilan Informasi Produk:
Informasi Produk: Di dalam Column, terdapat tiga elemen Text yang menampilkan informasi produk, yaitu:
Kode Produk: Menampilkan kode produk yang diperoleh dari widget.produk!.kodeProduk.
Nama Produk: Menampilkan nama produk yang diperoleh dari widget.produk!.namaProduk.
Harga Produk: Menampilkan harga produk dalam format "Rp. <harga>" yang diperoleh dari widget.produk!.hargaProduk.toString().
Setiap informasi produk ini ditampilkan dalam font dengan ukuran yang berbeda, yaitu 20.0 untuk kode produk dan 18.0 untuk nama dan harga produk. <br>
3. Tombol Hapus dan Edit:
Tombol Edit: Terdapat tombol bertuliskan "EDIT" yang menggunakan widget OutlinedButton. Ketika tombol ini ditekan, aplikasi akan mengarahkan pengguna ke halaman ProdukForm, yang memungkinkan pengguna untuk mengedit produk yang sedang ditampilkan. Produk yang sedang dilihat dikirim ke ProdukForm melalui parameter produk.
Tombol Delete: Terdapat tombol bertuliskan "DELETE" yang juga menggunakan OutlinedButton. Ketika tombol ini ditekan, sebuah konfirmasi penghapusan akan muncul, memastikan apakah pengguna benar-benar ingin menghapus produk tersebut. <br>
<br>


4. Edit Produk <br>
<img src="https://github.com/user-attachments/assets/7b9e4aab-cbec-4e1f-b04a-9b36c19c2c8c" width="250"> 
<img src="https://github.com/user-attachments/assets/11b98a0f-48c3-41aa-b9da-14f8fe616b24" width="250"> <br>

Penjelasan : <br>

Halaman ini akan menampilkan form dengan tiga input teks (kode produk, nama produk, harga produk) yang sudah terisi sebelumnya dan satu tombol untuk mengubah produk. <br>
Inputan: Pengguna akan diminta mengisi form untuk mengedit produk yang ada. <br>
Tombol Ubah: Tombol ini berada di bagian bawah form untuk mengirim data yang dimasukkan. <br>
Dialog Peringatan: Jika terjadi kesalahan, pengguna akan melihat dialog peringatan yang menginformasikan kegagalan ubah produk. <br>

<br>

5. Delete Produk <br>
<img src="https://github.com/user-attachments/assets/d1211969-3655-4ec2-b86c-298298b5d11d" width="250">
<img src="https://github.com/user-attachments/assets/0a694bc8-6ede-41cd-8d4d-2a16089ac550" width="250"> <br>
<br>
Kodenya : <br>

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
//tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            ProdukBloc.deleteProduk(id: int.parse(widget.produk!.id!)).then(
                (value) => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProdukPage()))
                    }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                        description: "Hapus gagal, silahkan coba lagi",
                      ));
            });
          },
        ),
//tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
<br>


Penjelasan : <br>

Tombol Delete: Terdapat tombol bertuliskan "DELETE" yang juga menggunakan OutlinedButton. Ketika tombol ini ditekan, sebuah konfirmasi penghapusan akan muncul, memastikan apakah pengguna benar-benar ingin menghapus produk tersebut. <br>
confirmHapus(): Fungsi ini menampilkan dialog konfirmasi yang berisi pesan "Yakin ingin menghapus data ini?". <br>
Tombol "Ya": Jika pengguna menekan tombol "Ya", maka produk yang sedang ditampilkan akan dihapus menggunakan ProdukBloc.deleteProduk. Setelah produk dihapus, aplikasi akan kembali ke halaman ProdukPage yang menampilkan daftar produk. <br>
Tombol "Batal": Tombol ini memungkinkan pengguna untuk membatalkan aksi penghapusan dan menutup dialog konfirmasi. <br>
Jika penghapusan produk gagal, aplikasi akan menampilkan WarningDialog yang menunjukkan pesan kegagalan dengan teks "Hapus gagal, silahkan coba lagi". <br>










        







      


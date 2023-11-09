import 'package:flutter/material.dart';



class DeveloperProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengembang'),
      leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
      },
    ),  
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Ganti dengan path gambar profil pengembang
              radius: 80, // Atur sesuai kebutuhan
            ),
            SizedBox(height: 20),
            Text(
              'Naufal Kamal',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Email: naufalkamal03@gmail.com'),
            Text('GitHub: github.com/mnaufalkamal'),
            // Tambahkan informasi profil pengembang lainnya di sini
          ],
        ),
      ),
    );
  }
}

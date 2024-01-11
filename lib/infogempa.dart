import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:http/http.dart' as http;

class infogempa extends StatefulWidget {
  @override
  _infogempaState createState() => _infogempaState();
}

class _infogempaState extends State<infogempa> {
  List<dynamic> dataCollection = [];
  bool isLoading = false; // Tambahkan indikator loading

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true; // Setel indikator loading menjadi true saat memuat data
    });

    try {
      final response = await http.get(Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json'));

      if (response.statusCode == 200) {
        // Jika request berhasil, parse data JSON
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> dataList = responseData['Infogempa']['gempa'];

        print('Data fetched successfully: $dataList');

        setState(() {
          dataCollection = dataList;
        });
      } else {
        // Jika request gagal, tampilkan pesan kesalahan
        print('Failed to load data. Status code: ${response.statusCode}');
        // Tampilkan snackbar atau pesan kesalahan lainnya
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal memuat data. Status code: ${response.statusCode}'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (error) {
      // Tangani kesalahan selama proses pengambilan data
      print('Error fetching data: $error');
      // Tampilkan snackbar atau pesan kesalahan lainnya
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $error'),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        isLoading = false; // Setel indikator loading kembali ke false setelah selesai memuat data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data BMKG'),
        // Tambahkan tombol kembali di sini
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke halaman sebelumnya saat tombol "back" ditekan
            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataCollection.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Tanggal: ${dataCollection[index]['Tanggal'] ?? 'N/A'}'),
                  subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jam: ${dataCollection[index]['Jam'] ?? 'N/A'}'),
                    Text('Magnitudo: ${dataCollection[index]['Magnitude'] ?? 'N/A'}'),
                    Text('Kedalaman: ${dataCollection[index]['Kedalaman'] ?? 'N/A'}'),
                    Text('Wilayah: ${dataCollection[index]['Wilayah'] ?? 'N/A'}'),
          
                  ],
      ),
                  // Tambahkan pengecekan serupa untuk bidang lainnya
                );
              },
            ),
    );
  }
}

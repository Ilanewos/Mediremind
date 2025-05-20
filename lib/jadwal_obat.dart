import 'package:flutter/material.dart';
import 'package:flutter_application_1/tambah_obat.dart';
import 'package:intl/intl.dart';

class JadwalObatPage extends StatefulWidget {
  const JadwalObatPage({super.key});

  @override
  State<JadwalObatPage> createState() => _JadwalObatPageState();
}

class _JadwalObatPageState extends State<JadwalObatPage> {
  final List<Map<String, dynamic>> daftarObat = [];

  Future<void> _navigateToTambahObat() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TambahObatPage()),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        daftarObat.add(result);
      });
    }
  }

  final DateFormat formatter = DateFormat('dd MMM yyyy • HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Obat'),
        backgroundColor: Colors.grey,
      ),
      body: daftarObat.isEmpty
          ? const Center(child: Text('Belum ada jadwal obat'))
          : ListView.builder(
              itemCount: daftarObat.length,
              itemBuilder: (context, index) {
                final obat = daftarObat[index];
                final String waktuFormatted =
                    obat['waktu'] != null && obat['waktu'].toString().isNotEmpty
                        ? formatter.format(DateTime.parse(obat['waktu']))
                        : 'Waktu tidak tersedia';

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(obat['nama'] ?? ''),
                    subtitle: Text('${obat['jenis']} • ${obat['dosis']} • $waktuFormatted'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToTambahObat,
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
    );
  }
}

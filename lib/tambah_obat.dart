import 'package:flutter/material.dart';

class TambahObatPage extends StatefulWidget {
  const TambahObatPage({super.key});

  @override
  State<TambahObatPage> createState() => _TambahObatPageState();
}

class _TambahObatPageState extends State<TambahObatPage> {
  final _formKey = GlobalKey<FormState>();

  String? _namaObat;
  String? _jenisObat;
  String? _dosisObat;
  DateTime? _waktuKonsumsi;

  final List<String> jenisObatList = [
    'Pil', 'Tablet', 'Kapsul', 'Sirup', 'Salep', 'Injeksi', 'Tetes',
  ];

  final List<String> dosisObatList = [
    '5 ml', '10 ml', '1 tablet', '2 tablet', '1 kapsul', '2 kapsul',
  ];

  Future<void> _pilihTanggalWaktu(BuildContext context) async {
    final tanggal = await showDatePicker(
      context: context,
      initialDate: _waktuKonsumsi ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (tanggal != null) {
      final waktu = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_waktuKonsumsi ?? DateTime.now()),
      );

      if (waktu != null) {
        setState(() {
          _waktuKonsumsi = DateTime(
            tanggal.year, tanggal.month, tanggal.day, waktu.hour, waktu.minute,
          );
        });
      }
    }
  }

  void _simpanObat() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_waktuKonsumsi == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Silakan pilih waktu konsumsi')),
        );
        return;
      }

      _formKey.currentState?.save();

      final dataObat = {
        'nama': _namaObat,
        'jenis': _jenisObat,
        'dosis': _dosisObat,
        'waktu': _waktuKonsumsi?.toIso8601String() ?? '',
      };

      // Kirim data kembali ke halaman sebelumnya
      Navigator.pop(context, dataObat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Obat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Obat'),
                validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => _namaObat = value,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Jenis Obat'),
                value: _jenisObat,
                items: jenisObatList
                    .map((jenis) => DropdownMenuItem(value: jenis, child: Text(jenis)))
                    .toList(),
                onChanged: (value) => setState(() => _jenisObat = value),
                validator: (value) => value == null ? 'Pilih jenis obat' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Dosis Obat'),
                value: _dosisObat,
                items: dosisObatList
                    .map((dosis) => DropdownMenuItem(value: dosis, child: Text(dosis)))
                    .toList(),
                onChanged: (value) => setState(() => _dosisObat = value),
                validator: (value) => value == null ? 'Pilih dosis obat' : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Waktu Konsumsi'),
                subtitle: Text(
                  _waktuKonsumsi != null
                      ? '${_waktuKonsumsi!.toLocal()}'
                      : 'Belum dipilih',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _pilihTanggalWaktu(context),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _simpanObat,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Simpan Obat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

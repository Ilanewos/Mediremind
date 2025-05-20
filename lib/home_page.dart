import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget stepItem(String number, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Text(number),
          radius: 14,
          backgroundColor: Colors.grey.shade300,
          foregroundColor: Colors.black,
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Riwayat Obat'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Tambah Obat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/tambah-obat');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Jadwal Obat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/jadwal-obat');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('SmartPill'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Aksi ketika tombol profil ditekan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Langkah-langkah Menambahkan Obat:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      stepItem('1', 'Klik tombol "Tambah Obat" di menu bawah.'),
                      const SizedBox(height: 16),
                      stepItem(
                          '2', 'Isi nama obat, dosis, dan jadwal minum obat.'),
                      const SizedBox(height: 16),
                      stepItem('3',
                          'Simpan data obat dan cek jadwal pada menu "Jadwal Obat".'),
                      const SizedBox(height: 16),
                      stepItem(
                          '4', 'Pastikan kamu minum obat sesuai jadwal ya!'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/tambah-obat');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/jadwal-obat');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Tambah Obat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal Obat',
          ),
        ],
      ),
    );
  }
}
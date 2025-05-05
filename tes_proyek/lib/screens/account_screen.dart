import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/footer_screen.dart';
import 'package:tes_proyek/screens/setting_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // Bagian search dan filter
            Row(
              children: [
                // Search TextField
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.chevron_left),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      isDense: true, // mengurangi tinggi otomatis
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      prefixIcon:
                          const Icon(Icons.search, size: 20), // ikon kecil
                      labelText: 'Search',
                      labelStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      filled: true,
                      fillColor:
                          const Color(0xfff6efef), // warna serupa dengan latar
                    ),
                    style: const TextStyle(fontSize: 14), // kecilkan teks input
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height:
                          250, // Tentukan tinggi agar Stack bekerja dengan baik
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Latar belakang abu
                          Container(
                            width: double.infinity,
                            height: 170,
                            color: Colors.grey.shade300,
                          ),

                          // Avatar utama
                          const Positioned(
                            left: 16,
                            top: 120,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.black,
                              child: Icon(Icons.person,
                                  color: Colors.white, size: 45),
                            ),
                          ),

                          // Tombol tambah
                          const Positioned(
                            left: 80,
                            top: 190,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.add_circle,
                                  size: 18, color: Colors.blue),
                            ),
                          ),

                          // Tombol Settings
                          Positioned(
                            right: 10,
                            top: 170,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  print("Settings button tapped!");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SettingScreen()),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Icon(Icons.settings, size: 28),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 70),

                    // Informasi akun
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Felix",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Student at UNIVERSITAS MULTI DATA PALEMBANG",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Stats
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("2",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Posting"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("1",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Follower"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("4",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Follow"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterScreen(
        currentIndex: 3,
      ),
    );
  }
}

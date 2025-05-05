import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/footer_screen.dart';
import 'package:tes_proyek/screens/account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  bool _isBackendSelected = false;
  bool _isFrontendSelected = false;
  bool _isFullstackSelected = false;
  bool _isBigDataSelected = false;
  bool _isCitraSelected = false;

  // Untuk mengontrol visibilitas filter floating
  OverlayEntry? _overlayEntry;

  int _currentIndex = 0;

  // Fungsi untuk menampilkan filter floating
  void _toggleFilterOverlay(BuildContext context) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createFilterOverlay(context);
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  // Membuat overlay untuk filter
  OverlayEntry _createFilterOverlay(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Layer transparan fullscreen untuk mendeteksi sentuhan di luar panel
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // Tutup overlay ketika area luar diklik
                if (_overlayEntry != null) {
                  _overlayEntry!.remove();
                  _overlayEntry = null;
                }
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // Panel filter yang sebenarnya
          Positioned(
            top: position.dy + 50,
            left: position.dx + size.width - 250,
            child: Material(
              color: Colors.transparent,
              child: StatefulBuilder(builder: (context, setStateOverlay) {
                return Container(
                  width: 250,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Filter by Category:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                        title: const Text('Backend'),
                        value: _isBackendSelected,
                        onChanged: (bool? value) {
                          setStateOverlay(() {
                            setState(() {
                              _isBackendSelected = value ?? false;
                            });
                          });
                        },
                        dense: true,
                      ),
                      CheckboxListTile(
                        title: const Text('Frontend'),
                        value: _isFrontendSelected,
                        onChanged: (bool? value) {
                          setStateOverlay(() {
                            setState(() {
                              _isFrontendSelected = value ?? false;
                            });
                          });
                        },
                        dense: true,
                      ),
                      CheckboxListTile(
                        title: const Text('Fullstack'),
                        value: _isFullstackSelected,
                        onChanged: (bool? value) {
                          setStateOverlay(() {
                            setState(() {
                              _isFullstackSelected = value ?? false;
                            });
                          });
                        },
                        dense: true,
                      ),
                      CheckboxListTile(
                        title: const Text('Big Data'),
                        value: _isBigDataSelected,
                        onChanged: (bool? value) {
                          setStateOverlay(() {
                            setState(() {
                              _isBigDataSelected = value ?? false;
                            });
                          });
                        },
                        dense: true,
                      ),
                      CheckboxListTile(
                        title: const Text('Citra'),
                        value: _isCitraSelected,
                        onChanged: (bool? value) {
                          setStateOverlay(() {
                            setState(() {
                              _isCitraSelected = value ?? false;
                            });
                          });
                        },
                        dense: true,
                      ),
                      // Tambahkan tombol Apply dan Reset
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              setStateOverlay(() {
                                setState(() {
                                  _isBackendSelected = false;
                                  _isFrontendSelected = false;
                                  _isFullstackSelected = false;
                                  _isBigDataSelected = false;
                                  _isCitraSelected = false;
                                });
                              });
                            },
                            child: const SizedBox(),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Terapkan filter dan tutup overlay
                              if (_overlayEntry != null) {
                                _overlayEntry!.remove();
                                _overlayEntry = null;
                              }
                              // Filter sudah diterapkan melalui setState di setiap checkbox
                            },
                            child: const SizedBox(),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0E7E7),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // Bagian search dan filter
            Row(
              children: [
                // Search TextField
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
                const SizedBox(width: 2),
                // Tombol untuk menampilkan filter
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () => _toggleFilterOverlay(context),
                ),
              ],
            ),
            // Menampilkan filter yang dipilih (opsional)
            if (_isBackendSelected ||
                _isFrontendSelected ||
                _isFullstackSelected ||
                _isBigDataSelected ||
                _isCitraSelected)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (_isBackendSelected) _buildFilterChip('Backend'),
                    if (_isFrontendSelected) _buildFilterChip('Frontend'),
                    if (_isFullstackSelected) _buildFilterChip('Fullstack'),
                    if (_isBigDataSelected) _buildFilterChip('Big Data'),
                    if (_isCitraSelected) _buildFilterChip('Citra'),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Account
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            color: Colors.grey[600]!.withOpacity(0.9),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'User Account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 2),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '+ Follow',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Gambar
                        Image.asset(
                          'pekerjaan/backend.jpg',
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 200,
                          fit: BoxFit.cover,
                        ),

                        // Like dan Favorite
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Colors.grey[500]!.withOpacity(0.9),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.thumb_up_alt_outlined,
                                      size: 19,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_border,
                                        size: 19),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterScreen(
        currentIndex: _currentIndex,
      ),
    );
  }

  // Widget untuk menampilkan chip filter yang dipilih
  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade100,
    );
  }
}

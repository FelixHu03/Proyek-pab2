import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundScreenWp extends StatelessWidget {
  final Widget? child;
  final String judul;
  final String judul2nd;
  final String gambar;
  final String deskripsi;
  final VoidCallback? onNextPage;
  final VoidCallback? onPreviousPage;
  const BackgroundScreenWp({
    Key? key,
    this.child,
    required this.judul,
    required this.judul2nd,
    required this.gambar,
    required this.deskripsi,
    this.onNextPage,
    this.onPreviousPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          'assets/background/BACKGROUND welcome Screen.png',
          fit: BoxFit.fill,
        ),

        // isi konten
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 100),
              //isi judul
              Text(
                judul,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // gambar
              Image.asset(
                gambar,
                height: 160,
              ),
              // second judul
              const SizedBox(height: 50),
              Text(
                judul2nd,
                style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // deskripsi
              Text(
                deskripsi,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
            ],
          ),
        ),
        // untuk tombol get started
        Positioned(
          bottom: 113,
          left: 0,
          right: 0,
          child: child ?? const SizedBox(height: 0,)
        ),

        // untuk indikator 3 dot
        const Positioned(
          bottom: 200,
          left: 0,
          right: 0,
          child: SizedBox(),
        ),

        // ketika klik kiri kembali
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          width: MediaQuery.of(context).size.width / 2,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onPreviousPage,
          ),
        ),

        // ketika klik kanan lanjut
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          width: MediaQuery.of(context).size.width / 2,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onNextPage,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/footer_screen.dart';
import 'package:tes_proyek/screens/account_screen.dart';

class PostingScreen extends StatefulWidget {
  const PostingScreen({super.key});

  @override
  State<PostingScreen> createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  final _descripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gunakan resizeToAvoidBottomInset agar keyboard tidak menutupi konten
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        // Gunakan SingleChildScrollView untuk memungkinkan scroll
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Foto',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )),
                            child: const Text(
                              'Posting',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'Deskripsi ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.only(top: 8, bottom: 10),
                      // Gunakan Column sebagai pengganti Row untuk TextField
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _descripsiController,
                            decoration: const InputDecoration(
                              hintText: 'write here ....', // Perbaikan typo
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                            ),
                            maxLines: null,
                            minLines: 3, // Minimal 3 baris
                            keyboardType:
                                TextInputType.multiline, // Mendukung multiline
                          ),
                        ],
                      ),
                    ),
                    // Tambahkan padding tambahan di bawah untuk menghindari tersembunyi oleh keyboard
                    SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? 280
                            : 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterScreen(currentIndex: 1),
    );
  }

  // plikasi Flutter Anda akan lebih efisien dalam penggunaan memori dan tidak akan 
  //mengalami masalah terkait memory leak atau pemanggilan metode pada objek yang telah dihancurkan.
  @override
  void dispose() {
    _descripsiController.dispose();
    super.dispose();
  }
}

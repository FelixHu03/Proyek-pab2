import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/footer_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String selectedValue = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0E7E7),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            // dark mode
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFB7B0B0),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/images/dark_light_mode.jpg'),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Dark/Light Mode',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 130,
                    ),
                    Image.asset('assets/images/switch_light_mode.png'),
                  ],
                )),
            // Kelola data Akun
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFB7B0B0),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.edit),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Kelola Data Akun',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.chevron_right))
                  ],
                )),
            // Bahasa
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFB7B0B0),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.public,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Bahasa',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 165,
                    ),
                    DropdownButton<String>(
                      value: selectedValue,
                      dropdownColor: Colors.grey,
                      items: <String>['Indonesia', 'Ingris']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    )
                  ],
                )),
            // Kebijakan Privasi & Syarat Ketentuan
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFB7B0B0),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.gavel,
                      color: Colors.brown,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Kebijakan Privasi & Syarat Ketentuan',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.chevron_right))
                  ],
                )),
            // Kontak
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFB7B0B0),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/images/telepon_rumah.png'),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Kebijakan Privasi & Syarat Ketentuan',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.chevron_right))
                  ],
                )),
            // FAQ
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFB7B0B0),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '?',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'FAQ (Perntanyaan Umum)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 93,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.chevron_right))
                  ],
                )),
            // logout
            const SizedBox(
              height: 250,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                        textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20,),
                  Icon(Icons.logout, color: Colors.white, size: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

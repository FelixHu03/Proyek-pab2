import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/background_screen/background_screen_wp.dart';
import 'package:tes_proyek/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  
  // Content for each page
  final List<Map<String, String>> _pageContent = [
    {
      'judul': 'JobNusa',
      'judul2nd': 'Welcome',
      'gambar': 'images/jobnusaicon.png',
      'deskripsi': 'Welcome to JobNusa\nFind The Best Career Opportunities\nfor Your Future!',
    },
    {
      'judul': '',
      'judul2nd': 'Find Your Dream Job',
      'gambar': 'images/wp2.png',
      'deskripsi': 'Search for Jobs Based On\nfield of Work, Location, \nand Personal Preference.',
    },
    {
      'judul': '',
      'judul2nd': 'Ready to Start Your Career?',
      'gambar': 'images/wp3.png',
      'deskripsi': 'With One Clik,\nFind the Best Jobs and Start Your \nCereer Journery Now!',
      'child': 'images/getStarted.png'
    },
  ];

  // Function to go to next page
  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
    } else {
      _goToHelloScreen();
    }
  }

  // Function to go to previous page
  void _previousPage() {
    if(_currentPage > 0){
      setState(() {
        _currentPage--;
      });
    }else{

    const WelcomeScreen();
    }
  }

  // Function to navigate to Login
  void _goToHelloScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get current page content
    final currentContent = _pageContent[_currentPage];
    
    return BackgroundScreenWp(
      judul: currentContent['judul']!,
      gambar: currentContent['gambar']!,
      deskripsi: currentContent['deskripsi']!,
      judul2nd: currentContent['judul2nd']!,
      onNextPage: _nextPage,
      onPreviousPage: _previousPage,
      child: Column(
        children: [
          if(_currentPage == 2 && currentContent.containsKey('child'))
          Image.asset(
          currentContent['child']!,
          height: 80,
          ),
          const SizedBox(height:60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: _currentPage == 0 ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 18),
              CircleAvatar(
                radius: 5,
                backgroundColor: _currentPage == 1 ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 18),
              CircleAvatar(
                radius: 5,
                backgroundColor: _currentPage == 2 ? Colors.black : Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
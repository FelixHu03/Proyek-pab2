import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/favorite_screen.dart';
import 'package:tes_proyek/screens/home_screen.dart';
import 'package:tes_proyek/screens/posting_screen.dart';
import 'package:tes_proyek/screens/account_screen.dart';

class FooterScreen extends StatefulWidget {
  final int currentIndex;
  // final Function(int) onTap;
  final Color indicatorColor;
  final double indicatorHeight;
  final double indicatorWidth;
  
  FooterScreen({
    Key? key,
    required this.currentIndex,
    // required this.onTap,
    this.indicatorColor = Colors.blue,
    this.indicatorHeight = 3.0,
    this.indicatorWidth = 40.0,
  }) : super(key: key);

  @override
  State<FooterScreen> createState() => _FooterScreenState();
}

class _FooterScreenState extends State<FooterScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostingScreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const FavoriteScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AccountScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Posting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: widget.indicatorHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => Container(
                  width: MediaQuery.of(context).size.width*0.2,
                  height: widget.indicatorHeight,
                  decoration: BoxDecoration(
                    color: index == widget.currentIndex ? widget.indicatorColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(widget.indicatorHeight / 2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}






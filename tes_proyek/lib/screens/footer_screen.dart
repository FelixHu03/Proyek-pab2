import 'package:flutter/material.dart';

class FooterScreen extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color indicatorColor;
  final double indicatorHeight;
  final double indicatorWidth;
  
  const FooterScreen({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.indicatorColor = Colors.blue,
    this.indicatorHeight = 3.0,
    this.indicatorWidth = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
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
            height: indicatorHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => Container(
                  width: indicatorWidth,
                  height: indicatorHeight,
                  decoration: BoxDecoration(
                    color: index == currentIndex ? indicatorColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(indicatorHeight / 2),
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
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> bottomBarItems = [];

  @override
  void initState() {
    super.initState();
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        title: Text('探索', style: TextStyle(fontWeight: FontWeight.normal))));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
        ),
        title: Text('列表', style: TextStyle(fontWeight: FontWeight.normal))));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer,
        ),
        title: Text('详情', style: TextStyle(fontWeight: FontWeight.normal))));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
        ),
        title: Text('通知', style: TextStyle(fontWeight: FontWeight.normal))));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: bottomBarItems,
          fixedColor: Color(0xFFF3791a),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed),
    );
  }
}

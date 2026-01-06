import 'package:flutter/material.dart';
import 'package:trace_app/home/view/home_screen.dart';
// import 'package:trace_app/widgets/icon_widgets.dart';

class DashboardScreen extends StatefulWidget {
  final String userName;
  const DashboardScreen({super.key, required this.userName});
  @override
  State<DashboardScreen> createState() {
    return _DashboardScreen();
  }
}

class _DashboardScreen extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("Page 2")),
    Center(child: Text("Page 3")),
    Center(child: Text("Page 4")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icons/icon-econtainer.png',
                color: _selectedIndex == 1 ? Colors.amber[800] : null,
              ),
              label: 'Entities',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icons/icon-container.png',
                color: _selectedIndex == 2 ? Colors.amber[800] : null,
              ),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icons/icon-containerp.png',
                color: _selectedIndex == 3 ? Colors.amber[800] : null,
              ),
              label: 'Profile',
            ),
          ],

          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

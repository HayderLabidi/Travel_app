import 'package:flutter/material.dart';
import 'package:travel/Homepage/mainpage.dart';
import 'package:travel/Homepage/messages.dart';
import 'package:travel/Homepage/profile.dart';

class Home extends StatefulWidget {
  final String username;

  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const Mainpage(),
      const MessengerPage(),
      ProfileView(username: widget.username),
  
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white70,
          elevation: 5,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.blueAccent,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail, size: 24),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 24),
              label: "Profile",
            ),
            
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: _screens[_selectedIndex],
      ),
    );
  }
}

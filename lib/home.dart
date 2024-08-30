import 'package:flutter/material.dart';
import 'package:travel/Homepage/mainpage.dart';
import 'package:travel/Homepage/messages.dart';
import 'package:travel/Homepage/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedindex = 0; // Default index for Mainpage

  final List<Widget> _screens = [
    const Mainpage(),
    const MessengerPage(),
    const ProfileView(),
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(180, 3, 168, 244),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: _selectedindex,
          onTap: _onItemTaped,
        ),
        body: _screens[_selectedindex],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel/Homepage/profile_settings/Help.dart';
import 'package:travel/Homepage/profile_settings/language.dart';
import 'package:travel/Homepage/profile_settings/notifcation.dart';
import 'package:travel/Homepage/profile_settings/security.dart';
import 'package:travel/Homepage/profile_settings/setting.dart';
import 'package:travel/login.dart';

class ProfileView extends StatelessWidget {
  final String username;

  const ProfileView({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(172, 201, 201, 201),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  height: 80,
                ),
                Positioned(
                  top: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/profile-user.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      Text(
                        username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(179, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 110),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildOutlinedButton(
                    context,
                    icon: Icons.settings,
                    label: 'Settings',
                    page: const SettingsPage(),
                  ),
                  const SizedBox(height: 15),
                  _buildOutlinedButton(
                    context,
                    icon: Icons.security,
                    label: 'Security',
                    page: const SecurityPage(),
                  ),
                  const SizedBox(height: 15),
                  _buildOutlinedButton(
                    context,
                    icon: Icons.language,
                    label: 'Language',
                    page: Language(),
                  ),
                  const SizedBox(height: 15),
                  _buildOutlinedButton(
                    context,
                    icon: Icons.notifications_rounded,
                    label: 'Notifications',
                    page: const Notifcation(),
                  ),
                  const SizedBox(height: 15),
                  _buildOutlinedButton(
                    context,
                    icon: Icons.help,
                    label: 'Help & Support',
                    page: const Help(),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 100),
                        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context,
      {required IconData icon, required String label, required Widget page}) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const Text('>', style: TextStyle(color: Colors.black , fontSize: 20,)),
        ],
      ),
    );
  }
}

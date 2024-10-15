import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('English'),
            trailing: const Icon(Icons.check, color: Colors.green), // Change based on selection
            onTap: () {
              // Action for selecting English
            },
          ),
          ListTile(
            title: const Text('العربية'), // Arabic
            trailing: const Icon(Icons.check), // Change based on selection
            onTap: () {
              // Action for selecting Arabic
            },
          ),
          ListTile(
            title: const Text('Français'), // French
            trailing: const Icon(Icons.check), // Change based on selection
            onTap: () {
              // Action for selecting French
            },
          ),
          ListTile(
            title: const Text('Español'), // Spanish
            trailing: const Icon(Icons.check), // Change based on selection
            onTap: () {
              // Action for selecting Spanish
            },
          ),
        ],
      ),
    );
  }
}

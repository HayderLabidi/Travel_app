import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: const Center(
        child: Text('Security Page'),
      ),
    );
  }
}

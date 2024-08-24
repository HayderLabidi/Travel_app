import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & support'),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: const Center(
        child: Text('Help & support'),
      ),
    );
  }
}
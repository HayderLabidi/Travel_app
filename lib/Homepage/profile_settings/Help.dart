import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & support'),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Help & support'),
      ),
    );
  }
}
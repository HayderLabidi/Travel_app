import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: const Center(
        child: Text('Saved page'),
      ),
    );
  }
}

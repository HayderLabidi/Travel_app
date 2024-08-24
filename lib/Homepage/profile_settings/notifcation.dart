import 'package:flutter/material.dart';

class Notifcation extends StatelessWidget {
  const Notifcation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: const Center(
        child: Text('Notification Page'),
      ),
    );
  }
}
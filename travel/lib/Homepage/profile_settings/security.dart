import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: Center(
        child: Text('Security Page'),
      ),
    );
  }
}

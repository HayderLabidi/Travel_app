import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final TextEditingController _messageController = TextEditingController();
  String _confirmationMessage = '';

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitRequest() {
    setState(() {
      _confirmationMessage = 'Your message has been sent successfully!';
      _messageController.clear(); // Clear the input field after submission
    });
  }

  void _clearMessage() {
    _messageController.clear();
    setState(() {
      _confirmationMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'If you need assistance, please write your message below:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Your message',
                hintText: 'Enter your question or issue here...',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _submitRequest,
                  child: const Text('Submit'),
                ),
                TextButton(
                  onPressed: _clearMessage,
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            if (_confirmationMessage.isNotEmpty)
              Text(
                _confirmationMessage,
                style: const TextStyle(color: Colors.green, fontSize: 16.0),
              ),
            const SizedBox(height: 32.0),
            const Text(
              'Contact Information:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text('Email: support@example.com'),
            const Text('Phone: +123 456 7890'),
            const SizedBox(height: 32.0),
            const Text(
              'Frequently Asked Questions:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '1. How do I reset my password?\n'
              '   - You can reset your password by clicking on "Forgot Password" in the login page.\n\n'
              '2. How can I change my email address?\n'
              '   - You can change your email address in the account settings under "Profile".',
            ),
          ],
        ),
      ),
    );
  }
}

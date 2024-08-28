import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';
import 'package:travel/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String? _selectedCountryCode = '+216';

  final Map<String, String> _countryCodes = {
    'US': '+1',
    'TN': '+216',
    'FR': '+33',
    'IN': '+91',
  };

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

 Future<bool> checkUserExists() async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/api/check-user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'username': _usernameController.text,
      'email': _emailController.text,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final usernameExists = data['usernameExists'] ?? false;
    final emailExists = data['emailExists'] ?? false;
    return usernameExists || emailExists; 
  } else {
    throw Exception('Failed to check user existence');
  }
}




  Future<void> _signUp() async {
  if (_formKey.currentState!.validate()) {
    try {
      final userExists = await checkUserExists();
      if (userExists) {
        setState(() {
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username or email already exists', style: TextStyle(color: Colors.red))),
        );
        return;
      }

      User user = User(
        phone: _selectedCountryCode! + _phoneController.text,
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        setState(() {
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign up successful!', style: TextStyle(color: Colors.green))),
        );
      } else {
        setState(() {
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to register user', style: TextStyle(color: Colors.red))),
        );
      }
    } catch (e) {
      setState(() {
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred: $e', style: const TextStyle(color: Colors.red))),
      );
    }
  } else {
    setState(() {
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please correct the errors in the form', style: TextStyle(color: Colors.red))),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: const Color.fromARGB(255, 0, 127, 162),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://i.pinimg.com/474x/86/c3/10/86c31067545cee8ea9dfe43ea5f8919d.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: const Color.fromARGB(255, 186, 186, 186).withOpacity(0.2),
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          final trimmedValue = value?.trim() ?? '';
                          if (trimmedValue.isEmpty) {
                            return 'Please enter your password';
                          } else if (!RegExp(r'^[a-zA-Z\d]{8,}$').hasMatch(trimmedValue)) {
                            return 'Password must be at minimum 8 characters and include only letters and numbers';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: !isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible = !isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Phone Number',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              value: _selectedCountryCode,
                              items: _countryCodes.entries.map((entry) {
                                return DropdownMenuItem<String>(
                                  value: entry.value,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Countries/${entry.key}.png',
                                        width: 25,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(entry.value),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedCountryCode = value;
                                });
                              },
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 24, 115, 185),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        },
                        child: const Text('Already have an account? Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

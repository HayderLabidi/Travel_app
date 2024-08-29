import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';
import 'package:travel/home.dart';
import 'package:travel/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailOrUsernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false; // Loading state

  @override
  void dispose() {
    _emailOrUsernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true; // Start loading spinner
    });

    final emailOrUsername = _emailOrUsernameController.text;
    final password = _passwordController.text;

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'usernameOrEmail': emailOrUsername,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        // Wait for 3 seconds before navigating to Home
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isLoading = false; // Stop loading spinner
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        setState(() {
          isLoading = false; // Stop loading spinner
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username/email or password', style: TextStyle(color: Colors.red))),
        );
      }
    } else {
      setState(() {
        isLoading = false; // Stop loading spinner
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to login', style: TextStyle(color: Colors.red))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color.fromARGB(255, 0, 127, 162),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/welcom_login/login.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: const Color.fromARGB(255, 138, 138, 138).withOpacity(0.1),
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.asset("assets/logo.png"),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _emailOrUsernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email or Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return TextField(
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
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: _login,
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUp()),
                          );
                        },
                        child: const Text(
                          "Signup from here",
                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text('Or login with'),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.facebook, color: Colors.blue, size: 36.0),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 16.0),
                          IconButton(
                            icon: const Icon(Icons.email, color: Colors.red, size: 36.0),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 16.0),
                          IconButton(
                            icon: const Icon(Icons.apple, color: Colors.black, size: 36.0),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isLoading)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ), // Display spinner with blur effect when loading
        ],
      ),
    );
  }
}

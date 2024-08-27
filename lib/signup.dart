import 'package:flutter/material.dart';
import 'package:travel/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String? _selectedCountryCode = '+216'; // Default country code
  String? _password;
  String? _formMessage;

  final Map<String, String> _countryCodes = {
    'US': '+1',
    'TN': '+216',
    'FR': '+33',
    'IN': '+91',
    // Add more countries and codes here
  };

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _formMessage = 'Sign up successful!';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign up successful!')),
      );
    } else {
      setState(() {
        _formMessage = 'Please correct the errors in the form';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
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
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return TextFormField(
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
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$')
                                  .hasMatch(value)) {
                                return 'Password must be at least 8 characters long and include numbers, uppercase, and lowercase letters';
                              }
                              _password = value;
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return TextFormField(
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
                              } else if (value != _password) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Phone Number',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/countries/${_countryCodes.entries.firstWhere((entry) => entry.value == _selectedCountryCode).key.toLowerCase()}.png',
                                  width: 24,
                                ),
                                const SizedBox(width: 8),
                                DropdownButton<String>(
                                  value: _selectedCountryCode,
                                  underline: Container(),
                                  items: _countryCodes.entries.map((entry) {
                                    return DropdownMenuItem<String>(
                                      value: entry.value,
                                      child: Text(entry.value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedCountryCode = newValue;
                                    });
                                  },
                                ),
                              ],
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
                      const SizedBox(height: 16.0),
                      if (_formMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            _formMessage!,
                            style: TextStyle(
                              color: _formMessage == 'Sign up successful!'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: _signUp,
                            child: const Text('Sign Up '),
                          ),                          
                        ],
                      ),
                      InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            },
                            child: const Text("Already have an account ?", style: TextStyle(color: Color.fromARGB(255, 239, 239, 239) , fontSize: 18,) ,),
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

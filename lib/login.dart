import 'package:flutter/material.dart';
import 'package:travel/home.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = false;
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
            child:Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                    image: AssetImage('assets/welcom_login/login.jpg'),
                    fit: BoxFit.cover)),
          )),
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
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return TextField(
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
                            onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const Home()),
                                (Route<dynamic> route) => false,
                              );
                              
                            },
                            child: const Text('Login'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUp()),
                              );
                            },
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text('Or login with'),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.facebook, color: Colors.blue, size: 36.0),
                            onPressed: () {
                             
                            },
                          ),
                          const SizedBox(width: 16.0),
                          IconButton(
                            icon: const Icon(Icons.email, color: Colors.red, size: 36.0),
                            onPressed: () {
                             
                            },
                          ),
                          const SizedBox(width: 16.0),
                          IconButton(
                            icon: const Icon(Icons.apple, color: Colors.black, size: 36.0),
                            onPressed: () {
                              
                            },
                          ),
                        ],
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

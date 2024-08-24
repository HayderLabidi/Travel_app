import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart'; 

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                    image: AssetImage('assets/welcom_login/wlcm.jpg'),
                    fit: BoxFit.cover)),
              
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'WELCOME TO OUR \nAPP',
                  style: TextStyle(
                      color: Color.fromARGB(255, 66, 66, 66),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Book Your Tickets To Your Unique Location\nWith Beautiful Views & Services',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 450,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 50),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: Text(
                      "Let's Get Started".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

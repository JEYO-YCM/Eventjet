import 'package:eventjet/screens/bottomBar.dart';
import 'package:eventjet/screens/home.dart';
import 'package:eventjet/screens/registrationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Custom SVG or Icon at the top
              SvgPicture.asset(
                'assets/landing_icon.svg', // Replace with your SVG path
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 30),

              // Title
              const Text(
                'Welcome to EventJet',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 112, 35), // Primary color
                ),
              ),
              const SizedBox(height: 15),

              // Subtitle or tagline
              const Text(
                'Your Ultimate Event Ticketing Platform',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 50),

              // Login Button
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 2, 112, 35), // Primary color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to Login Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BottomBar()), // Replace with your Login Page
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Registration Button
              SizedBox(
                width: 250,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 2, 112, 35), // Primary color
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to Registration Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegistrationPage()), // Replace with your Registration Page
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 2, 112, 35), // Primary color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // Placeholder for LoginPage (Replace with your actual login page)
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         backgroundColor: Color.fromARGB(255, 2, 112, 35),
//       ),
//       body: Center(
//         child: const Text('Login Page Content'),
//       ),
//     );
//   }
// }

// Placeholder for RegistrationPage (Replace with your actual registration page)
// class RegistrationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register'),
//         backgroundColor: Color.fromARGB(255, 2, 112, 35),
//       ),
//       body: Center(
//         child: const Text('Registration Page Content'),
//       ),
//     );
//   }
// }

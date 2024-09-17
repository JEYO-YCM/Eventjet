import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart'; // For icons
import 'package:eventjet/screens/registrationpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 112, 35),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo/Icon
                  Icon(
                    FluentSystemIcons.ic_fluent_person_filled,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 30),

                  // Welcome Text
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Log in to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Input Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 2, 112, 35)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                        ),
                        SizedBox(height: 20),

                        // Password Input Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 2, 112, 35)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        // Login Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Perform login logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Logging in')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Button background color
                            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 112, 35),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Register Button
                        TextButton(
                          onPressed: () {
                            // Navigate to registration page
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegistrationPage()), // Replace with your Registration Page
                            );
                          },
                          child: Text(
                            'Don’t have an account? Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

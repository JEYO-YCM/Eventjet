import 'package:eventjet/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart'; // For icons

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
                    FluentSystemIcons.ic_fluent_person_add_filled,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 30),

                  // Welcome Text
                  Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sign up to get started",
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
                        // Username Input Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.person,
                                  color: Color.fromARGB(255, 2, 112, 35)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),

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
                              prefixIcon: Icon(Icons.email,
                                  color: Color.fromARGB(255, 2, 112, 35)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
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
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromARGB(255, 2, 112, 35)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        // Confirm Password Input Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromARGB(255, 2, 112, 35)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
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
                        ),
                        SizedBox(height: 20),

                        // Register Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Perform registration logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Processing Registration')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Updated property
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 112, 35),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Login Button
                        TextButton(
                          onPressed: () {
                            // Navigate to login page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage()), // Replace with your Registration Page
                            );
                          },
                          child: Text(
                            'Already have an account? Login',
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
    home: RegistrationPage(),
  ));
}

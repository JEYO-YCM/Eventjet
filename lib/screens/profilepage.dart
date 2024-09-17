import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart'; // For icons

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize with some example data
    _nameController.text = "John Doe";
    _contactController.text = "+1234567890";
    _emailController.text = "johndoe@example.com";
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 2, 112, 35),
                  child: Icon(
                    FluentSystemIcons.ic_fluent_person_filled,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Edit Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _toggleEditing,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 2, 112, 35),
                  ),
                  child: Text(_isEditing ? 'Cancel' : 'Edit'),
                ),
              ),
              SizedBox(height: 20),

              // Form for editing profile information
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name Input Field
                    TextFormField(
                      controller: _nameController,
                      readOnly: !_isEditing,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person,
                            color: Color.fromARGB(255, 2, 112, 35)),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Contact Input Field
                    TextFormField(
                      controller: _contactController,
                      readOnly: !_isEditing,
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        prefixIcon: Icon(Icons.phone,
                            color: Color.fromARGB(255, 2, 112, 35)),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your contact number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Email Input Field
                    TextFormField(
                      controller: _emailController,
                      readOnly: !_isEditing,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email,
                            color: Color.fromARGB(255, 2, 112, 35)),
                        border: OutlineInputBorder(),
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
                    SizedBox(height: 20),

                    // Save Button
                    if (_isEditing)
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Save the profile information
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Profile updated')),
                            );
                            _toggleEditing(); // Exit edit mode
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 2, 112, 35),
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
    );
  }
}

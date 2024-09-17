import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Organizer Profile"),
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to Edit Profile page
            },
            tooltip: 'Edit Profile',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://example.com/profile-picture.jpg', // Replace with profile image URL
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[800],
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/edit_profile_icon.svg', // Replace with your SVG path
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigate to Edit Profile page
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Name
            Text(
              'Organizer Name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Contact Information
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.grey),
                        const SizedBox(width: 10),
                        Text(
                          '+1234567890', // Replace with contact number
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.email, color: Colors.grey),
                        const SizedBox(width: 10),
                        Text(
                          'organizer@example.com', // Replace with email
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey),
                        const SizedBox(width: 10),
                        Text(
                          '123 Event Street, City, Country', // Replace with address
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

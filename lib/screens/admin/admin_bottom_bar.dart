import 'package:eventjet/screens/admin/organizerhomepage.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:eventjet/screens/admin/post_event_page.dart';
import 'package:eventjet/screens/admin/orginizer_profile_page.dart'; // Import your Profile page

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _currentIndex = 0;

  // List of widgets for each tab
  final List<Widget> _pages = [
    OrganizerHomePage(), // Replace with your Home page widget
    PostEventPage(), // Replace with your Post Event page widget
    ProfilePage(), // Replace with your Profile page widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // No back arrow
        title: RichText(
          text: TextSpan(
            text: "Event",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "Jet",
                style: const TextStyle(
                  color: Color.fromARGB(255, 2, 112, 35),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex], // Display the corresponding page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 2, 112, 35), // Background color
        elevation: 10,
        iconSize: 24, // Icon size
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        currentIndex: _currentIndex, // Set the selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index when tapped
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_add_circle_regular), // Post Event icon
            activeIcon: Icon(FluentSystemIcons.ic_fluent_add_circle_filled),
            label: "Post Event",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

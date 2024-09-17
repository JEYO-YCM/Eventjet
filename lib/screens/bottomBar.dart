import 'package:eventjet/screens/admin/admin_bottom_bar.dart';
import 'package:eventjet/screens/admin/organizerhomepage.dart';
import 'package:eventjet/screens/home.dart';
import 'package:eventjet/screens/landingscreen.dart'; // Assuming this is the landing page
import 'package:flutter/material.dart';
import 'package:eventjet/screens/profilepage.dart';
import 'package:eventjet/screens/ticketviewpage.dart';
import 'package:eventjet/screens/notificationpage.dart'; // Import the NotificationsPage
import 'package:fluentui_icons/fluentui_icons.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  // List of widgets for each tab
  final List<Widget> _pages = [
    HomePage(),
    TicketViewPage(),
    NotificationPage(), // Add NotificationsPage here
    ProfilePage(),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate to Landing Page and remove BottomBar from stack
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LandingPage(), // Replace with your landing page widget
                ),
              );
            },
            tooltip: 'Log Out',
          ),
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              // Navigate to Landing Page and remove BottomBar from stack
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CustomBottomBar(), // Replace with your landing page widget
                ),
              );
            },
            tooltip: 'Log Out',
          ),
        ],
      ),
      body: _pages[_currentIndex], // Display the corresponding page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 2, 112, 35), // Background color
        elevation: 10,
        iconSize: 20, // Icon size
        selectedItemColor: Color.fromARGB(255, 2, 112, 35),
        unselectedItemColor: Colors.black,
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
            icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
            label: "Ticket",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_channel_notifications_regular), // Notifications icon
            activeIcon:
                Icon(FluentSystemIcons.ic_fluent_channel_notifications_filled),
            label: "Notifications",
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG support
import 'package:fluentui_icons/fluentui_icons.dart'; // For icons

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "eventTitle": "Music Festival",
      "message": "Get ready for a night of incredible music!",
      "details":
          "Join us on July 15th at the downtown arena for a music festival featuring top artists from around the world.",
    },
    {
      "eventTitle": "Art Exhibition",
      "message": "Discover the beauty of modern art.",
      "details":
          "Experience a curated selection of contemporary art pieces from emerging and established artists. The exhibition opens on August 10th.",
    },
    // Add more notifications as necessary
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotificationDetailPage(notification: notification),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 2, 112, 35),
                    width: 2,
                  ),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: SvgPicture.asset(
                    'assets/icons/notification.svg', // Path to your SVG icon
                    width: 40,
                    color: Color.fromARGB(255, 2, 112, 35),
                  ),
                  title: Text(
                    notification['eventTitle']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    notification['message']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final Map<String, String> notification;

  NotificationDetailPage({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notification Details'),
        backgroundColor: Color.fromARGB(255, 2, 112, 35),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['eventTitle']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              notification['message']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: 20),
            Text(
              notification['details']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

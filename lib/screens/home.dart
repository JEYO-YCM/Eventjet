import 'package:eventjet/utils/mediacard.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:eventjet/screens/bottomBar.dart';
// ignore: unused_import
import 'package:fluentui_icons/fluentui_icons.dart';

class HomePage extends StatelessWidget {
  // Updated _post list with the required data for each event
  final List<Map<String, String>> _post = [
    {
      "imageUrl": "assets/images/image1",
      "eventTitle": "Music Festival",
      "eventInfo": "Join us for an unforgettable night of music and fun!",
      "ticketPrice": "\$50"
    },
    {
      "imageUrl": "https://example.com/event-image2.jpg",
      "eventTitle": "Art Exhibition",
      "eventInfo": "Explore the stunning works of modern artists.",
      "ticketPrice": "\$30"
    },
    {
      "imageUrl": "https://example.com/event-image3.jpg",
      "eventTitle": "Food Carnival",
      "eventInfo": "Indulge in a world of flavors and delicacies.",
      "ticketPrice": "\$25"
    },
    {
      "imageUrl": "https://example.com/event-image4.jpg",
      "eventTitle": "Comedy Show",
      "eventInfo": "A night full of laughter with top comedians!",
      "ticketPrice": "\$20"
    },
    // Add more events as necessary
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          // Get each event data
          final post = _post[index];

          // Pass the dynamic data to Mediacard
          return Mediacard(
            imageUrl: post['imageUrl'] ?? '',
            eventTitle: post['eventTitle'] ?? '',
            eventInfo: post['eventInfo'] ?? '',
            ticketPrice: post['ticketPrice'] ?? '',
          );
        },
      ),
    );
  }
}

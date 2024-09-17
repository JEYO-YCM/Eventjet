import 'package:eventjet/utils/mediacard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Updated _post list with the required data for each event
  final List<Map<String, String>> _post = [
    {
      "imageUrl": "assets/images/image1",
      "eventTitle": "Music Festival",
      "eventInfo": "Join us for an unforgettable night of music and fun!",
      "ticketPrice": "\$50",
      "mobileMoneyLine": "123456789", // Added mobile money line
      "registeredName": "John Doe", // Added registered name
    },
    {
      "imageUrl": "https://example.com/event-image2.jpg",
      "eventTitle": "Art Exhibition",
      "eventInfo": "Explore the stunning works of modern artists.",
      "ticketPrice": "\$30",
      "mobileMoneyLine": "987654321", // Added mobile money line
      "registeredName": "Jane Doe", // Added registered name
    },
    {
      "imageUrl": "https://example.com/event-image3.jpg",
      "eventTitle": "Food Carnival",
      "eventInfo": "Indulge in a world of flavors and delicacies.",
      "ticketPrice": "\$25",
      "mobileMoneyLine": "1122334455", // Added mobile money line
      "registeredName": "Chef Cook", // Added registered name
    },
    {
      "imageUrl": "https://example.com/event-image4.jpg",
      "eventTitle": "Comedy Show",
      "eventInfo": "A night full of laughter with top comedians!",
      "ticketPrice": "\$20",
      "mobileMoneyLine": "9988776655", // Added mobile money line
      "registeredName": "Funny Guy", // Added registered name
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
            mobileMoneyLine:
                post['mobileMoneyLine'] ?? '', // Pass mobile money line
            registeredName:
                post['registeredName'] ?? '', // Pass registered name
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eventjet/screens/admin/organizereventviewpage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrganizerHomePage extends StatelessWidget {
  final List<Event> events = [
    // Example events; replace with actual data
    Event(
      imageUrl: 'https://example.com/image.jpg',
      eventTitle: 'Event 1',
      eventInfo: 'Event 1 info',
      ticketPrice: '10.00',
    ),
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizer Home Page'),
        backgroundColor: Colors.green[800],
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return EventCard(
            imageUrl: event.imageUrl,
            eventTitle: event.eventTitle,
            eventInfo: event.eventInfo,
            ticketPrice: event.ticketPrice,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrganizerEventViewPage(event: event),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Event {
  final String imageUrl;
  final String eventTitle;
  final String eventInfo;
  final String ticketPrice;

  Event({
    required this.imageUrl,
    required this.eventTitle,
    required this.eventInfo,
    required this.ticketPrice,
  });
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String eventTitle;
  final String eventInfo;
  final String ticketPrice;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.eventTitle,
    required this.eventInfo,
    required this.ticketPrice,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      eventInfo,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Price: $ticketPrice',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
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

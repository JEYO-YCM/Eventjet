import 'package:flutter/material.dart';
import 'package:eventjet/screens/purchaseticketpage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventViewPage extends StatelessWidget {
  final String imageUrl;
  final String eventTitle;
  final String eventInfo;
  final String ticketPrice;

  const EventViewPage({
    super.key,
    required this.imageUrl,
    required this.eventTitle,
    required this.eventInfo,
    required this.ticketPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventTitle),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 20),
              Text(
                eventTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                eventInfo,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Price: $ticketPrice',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to BuyTicketPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuyTicketPage(
                          eventTitle: 'yomaps',
                          ticketPrice: '320',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.green[800],
                  ),
                  child: const Text('Buy Ticket'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

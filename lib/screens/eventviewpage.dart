import 'package:flutter/material.dart';
import 'package:eventjet/screens/purchaseticketpage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventViewPage extends StatelessWidget {
  final String imageUrl;
  final String eventTitle;
  final String eventInfo;
  final String ticketPrice;
  final String mobileMoneyLine;
  final String registeredName;

  const EventViewPage({
    super.key,
    required this.imageUrl,
    required this.eventTitle,
    required this.eventInfo,
    required this.ticketPrice,
    required this.mobileMoneyLine,
    required this.registeredName,
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
              // Event Image
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline),
              ),
              const SizedBox(height: 20),

              // Event Title
              Text(
                eventTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Event Info
              Text(
                eventInfo,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),

              // Ticket Price
              Text(
                'Ticket Price: $ticketPrice',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Payment Details Section Title
              Text(
                'Payment Details:',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Mobile Money Line
              Text(
                'Mobile Money Line: $mobileMoneyLine',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),

              // Registered Name
              Text(
                'Registered Name: $registeredName',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),

              // Buy Ticket Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to BuyTicketPage and pass event details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyTicketPage(
                          eventTitle: eventTitle, // Pass the event title
                          ticketPrice: ticketPrice,
                          mobileMoneyLine: mobileMoneyLine,
                          registeredName: registeredName,
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

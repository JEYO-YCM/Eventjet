import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String eventTitle;
  final String eventInfo;
  final String ticketPrice;
  final String mobileMoneyLine; // Added parameter
  final String registeredName; // Added parameter

  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.eventTitle,
    required this.eventInfo,
    required this.ticketPrice,
    required this.mobileMoneyLine, // Initialize parameter
    required this.registeredName, // Initialize parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TicketManagementPage(
              mobileMoneyLine: mobileMoneyLine, // Pass payment details
              registeredName: registeredName, // Pass payment details
            ),
          ),
        );
      },
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
                      'Mobile Money Line: $mobileMoneyLine', // Display mobile money line
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Registered Name: $registeredName', // Display registered name
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: $ticketPrice',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                Color.fromARGB(255, 2, 112, 35), // Your color
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/ticket_icon.svg', // Path to your SVG icon
                          height: 24,
                          width: 24,
                        ),
                      ],
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

class TicketManagementPage extends StatelessWidget {
  final String mobileMoneyLine; // Added parameter
  final String registeredName; // Added parameter

  const TicketManagementPage({
    Key? key,
    required this.mobileMoneyLine, // Initialize parameter
    required this.registeredName, // Initialize parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Management'),
        backgroundColor: Color.fromARGB(255, 2, 112, 35), // Your color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile Money Line: $mobileMoneyLine', // Display mobile money line
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Registered Name: $registeredName', // Display registered name
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            // Additional content for the Ticket Management Page can go here
            Center(
              child: Text('Manage your tickets here.'),
            ),
          ],
        ),
      ),
    );
  }
}

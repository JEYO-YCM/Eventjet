import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TicketViewPage extends StatefulWidget {
  @override
  _TicketViewPageState createState() => _TicketViewPageState();
}

class _TicketViewPageState extends State<TicketViewPage> {
  // Sample tickets list with additional keys
  final List<Map<String, String>> _post = [
    {
      "imageUrl": "https://example.com/event-image1.jpg",
      "eventTitle": "Music Festival",
      "eventInfo": "Join us for an unforgettable night of music and fun!",
      "ticketPrice": "\$50",
      "qrCodeUrl": "https://example.com/qr-code1.jpg",
      "userName": "John Doe",
      "contactNumber": "+1234567890",
    },
    {
      "imageUrl": "https://example.com/event-image2.jpg",
      "eventTitle": "Art Exhibition",
      "eventInfo": "Explore the stunning works of modern artists.",
      "ticketPrice": "\$30",
      "qrCodeUrl": "https://example.com/qr-code2.jpg",
      "userName": "Jane Smith",
      "contactNumber": "+0987654321",
    },
    {
      "imageUrl": "https://example.com/event-image3.jpg",
      "eventTitle": "Food Carnival",
      "eventInfo": "Indulge in a world of flavors and delicacies.",
      "ticketPrice": "\$25",
      "qrCodeUrl": "https://example.com/qr-code3.jpg",
      "userName": "Alice Johnson",
      "contactNumber": "+1122334455",
    },
    {
      "imageUrl": "https://example.com/event-image4.jpg",
      "eventTitle": "Comedy Show",
      "eventInfo": "A night full of laughter with top comedians!",
      "ticketPrice": "\$20",
      "qrCodeUrl": "https://example.com/qr-code4.jpg",
      "userName": "Bob Brown",
      "contactNumber": "+5566778899",
    },
    // Add more events as necessary
  ];

  void _deleteTicket(int index) {
    setState(() {
      _post.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          final ticket = _post[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: ticket['imageUrl']!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Details
                        Text(
                          'Name: ${ticket['userName']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Contact: ${ticket['contactNumber']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Event Details
                        Text(
                          'Event: ${ticket['eventTitle']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ticket['eventInfo']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Ticket Price
                        Text(
                          'Price: ${ticket['ticketPrice']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // QR Code
                        Text(
                          'QR Code:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: ticket['qrCodeUrl']!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Delete Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => _deleteTicket(index),
                            child: Text(
                              'Delete Ticket',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

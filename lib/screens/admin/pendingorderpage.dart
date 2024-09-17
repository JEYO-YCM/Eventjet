import 'package:flutter/material.dart';
import 'package:eventjet/screens/admin/validationpage.dart';
import 'package:eventjet/screens/admin/order.dart';

class PendingOrdersPage extends StatelessWidget {
  final List<Order> orders = [
    // Example orders; replace with actual data
    Order(
      ticketImageUrl: 'https://example.com/ticket.jpg',
      userName: 'John Doe',
      userEmail: 'john@example.com',
      eventTitle: 'Event 1',
      proofOfPaymentImageUrl: 'https://example.com/payment.jpg',
    ),
    // Add more orders here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Orders'),
        backgroundColor: Colors.green[800], // Custom color
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(order.ticketImageUrl),
              title: Text(order.userName),
              subtitle:
                  Text('Event: ${order.eventTitle}\nEmail: ${order.userEmail}'),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ValidationPage(order: order),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

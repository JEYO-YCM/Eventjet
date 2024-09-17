import 'package:flutter/material.dart';
import 'package:eventjet/screens/admin/order.dart';

class ValidationPage extends StatelessWidget {
  final Order order;

  const ValidationPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validate Ticket'),
        backgroundColor: Colors.green[800], // Custom color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(order.ticketImageUrl,
                height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text('Name: ${order.userName}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: ${order.userEmail}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Event: ${order.eventTitle}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('Proof of Payment:', style: const TextStyle(fontSize: 16)),
            Image.network(order.proofOfPaymentImageUrl,
                height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle approve action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800], // Custom color
                  ),
                  child: const Text('Approve Ticket'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle reject action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[800], // Custom color
                  ),
                  child: const Text('Reject Ticket'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

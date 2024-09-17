import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventjet/screens/EventViewPage.dart';

class Mediacard extends StatelessWidget {
  final String imageUrl;
  final String eventTitle;
  final String eventInfo;
  final String ticketPrice;
  final String mobileMoneyLine;
  final String registeredName;

  const Mediacard({
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventViewPage(
                imageUrl: imageUrl,
                eventTitle: eventTitle,
                eventInfo: eventInfo,
                ticketPrice: ticketPrice,
                mobileMoneyLine: mobileMoneyLine,
                registeredName: registeredName,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
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
                padding: const EdgeInsets.all(12.0),
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
                    const SizedBox(height: 8),
                    Text(
                      eventInfo,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Mobile Money Line: $mobileMoneyLine',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Registered Name: $registeredName',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: $ticketPrice',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Define action on press, such as navigating to purchase page or showing more info
                          },
                          icon: const Icon(Icons.arrow_forward),
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

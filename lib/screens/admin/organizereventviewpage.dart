import 'package:eventjet/screens/admin/organizerhomepage.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventjet/screens/admin/pendingorderpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluentui_icons/fluentui_icons.dart'; // Import Fluent UI icons

class OrganizerEventViewPage extends StatefulWidget {
  final Event event;

  const OrganizerEventViewPage({Key? key, required this.event})
      : super(key: key);

  @override
  _OrganizerEventViewPageState createState() => _OrganizerEventViewPageState();
}

class _OrganizerEventViewPageState extends State<OrganizerEventViewPage> {
  final _eventInfoController = TextEditingController();
  final _notificationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _eventInfoController.text =
        widget.event.eventInfo; // Pre-fill with event info
  }

  @override
  void dispose() {
    _eventInfoController.dispose();
    _notificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.eventTitle),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.event.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.eventTitle,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Ticket Price: ${widget.event.ticketPrice}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Event Info Update Section
                        const Text(
                          'Update Event Info:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _eventInfoController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'Update event information...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Implement logic for updating event info
                          },
                          icon: const Icon(FluentSystemIcons
                              .ic_fluent_edit_filled), // Fluent UI edit icon
                          label: const Text('Update Event Info'),
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.green[700], // Set icon color
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Approved and Pending Tickets
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/approved_icon.svg', // Approved icon SVG
                          height: 48,
                          width: 48,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Approved Tickets: 20', // Dummy number
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/pending_icon.svg', // Pending icon SVG
                        height: 24,
                        width: 24,
                      ),
                      title: const Text('Pending Tickets'),
                      subtitle: const Text('15'), // Dummy number
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Centered Pending Orders Button with Icon
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PendingOrdersPage(),
                      ),
                    );
                  },
                  icon: const Icon(FluentSystemIcons
                      .ic_fluent_timer_filled), // Fluent UI timer icon
                  label: const Text('View Pending Orders'),
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.green[700], // Set icon color
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Notification Section
              const Divider(),
              const Text(
                'Send Notification to Users:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _notificationController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter your notification message...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Implement the logic for sending the notification
                },
                icon: const Icon(FluentSystemIcons
                    .ic_fluent_send_filled), // Fluent UI send icon
                label: const Text('Send Notification'),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.green[700], // Set icon color
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

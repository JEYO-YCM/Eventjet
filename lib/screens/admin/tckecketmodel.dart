class Ticket {
  final String imageUrl;
  final String userName;
  final String contactNumber;
  final String eventTitle;
  final String eventDetails;
  final String qrCodeUrl;

  Ticket({
    required this.imageUrl,
    required this.userName,
    required this.contactNumber,
    required this.eventTitle,
    required this.eventDetails,
    required this.qrCodeUrl,
  });
}

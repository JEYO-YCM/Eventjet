// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class GateTicketValidationPage extends StatefulWidget {
//   @override
//   _GateTicketValidationPageState createState() => _GateTicketValidationPageState();
// }

// class _GateTicketValidationPageState extends State<GateTicketValidationPage> {
//   final GlobalKey<QRViewController> _qrKey = GlobalKey<QRViewController>();
//   QRViewController? _controller;
//   String _resultMessage = '';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       _controller = controller;
//     });

//     _controller?.scannedDataStream.listen((scanData) async {
//       final ticketId = scanData.code;
//       if (ticketId != null) {
//         await _validateTicket(ticketId);
//       }
//     });
//   }

//   Future<void> _validateTicket(String ticketId) async {
//     try {
//       final ticketDoc = FirebaseFirestore.instance.collection('tickets').doc(ticketId);
//       final ticketSnapshot = await ticketDoc.get();

//       if (ticketSnapshot.exists) {
//         final ticketData = ticketSnapshot.data();
//         if (ticketData != null && !ticketData['isUsed']) {
//           await ticketDoc.update({'isUsed': true});
//           setState(() {
//             _resultMessage = 'Ticket is valid and has been marked as used.';
//           });
//         } else {
//           setState(() {
//             _resultMessage = 'Ticket is invalid or has already been used.';
//           });
//         }
//       } else {
//         setState(() {
//           _resultMessage = 'Ticket not found.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _resultMessage = 'Error validating ticket.';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gate Ticket Validation'),
//         backgroundColor: Colors.green[800],
//       ),
//       body: Stack(
//         children: [
//           QRView(
//             key: _qrKey,
//             onQRViewCreated: _onQRViewCreated,
//           ),
//           Center(
//             child: Text(
//               _resultMessage,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

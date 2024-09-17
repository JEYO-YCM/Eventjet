import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images from gallery

class PostEventPage extends StatefulWidget {
  @override
  _PostEventPageState createState() => _PostEventPageState();
}

class _PostEventPageState extends State<PostEventPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventDetailsController = TextEditingController();
  final TextEditingController _vipPriceController = TextEditingController();
  final TextEditingController _ordinaryPriceController =
      TextEditingController();
  final TextEditingController _vvipPriceController = TextEditingController();
  XFile? _eventImage; // Stores the picked image

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _eventImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Event"),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Event Title
              TextFormField(
                controller: _eventTitleController,
                decoration: const InputDecoration(
                  labelText: 'Event Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the event title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Event Details
              TextFormField(
                controller: _eventDetailsController,
                decoration: const InputDecoration(
                  labelText: 'Event Details',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the event details';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // VIP Price
              TextFormField(
                controller: _vipPriceController,
                decoration: const InputDecoration(
                  labelText: 'VIP Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the VIP price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Ordinary Price
              TextFormField(
                controller: _ordinaryPriceController,
                decoration: const InputDecoration(
                  labelText: 'Ordinary Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ordinary price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // VVIP Price
              TextFormField(
                controller: _vvipPriceController,
                decoration: const InputDecoration(
                  labelText: 'VVIP Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the VVIP price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Event Image
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Upload Event Image'),
                  ),
                  const SizedBox(width: 16.0),
                  _eventImage != null
                      ? Image.network(
                          _eventImage!.path,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : const Text('No image selected'),
                ],
              ),
              const SizedBox(height: 16.0),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform submit logic here
                    // You can also use _eventImage if an image was selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Event Posted Successfully')),
                    );
                  }
                },
                child: const Text('Post Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _eventTitleController.dispose();
    _eventDetailsController.dispose();
    _vipPriceController.dispose();
    _ordinaryPriceController.dispose();
    _vvipPriceController.dispose();
    super.dispose();
  }
}

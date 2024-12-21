import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceSelectionScreen extends StatefulWidget {
  @override
  _ServiceSelectionScreenState createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  String? _selectedService;
  final _customerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Service')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _customerIdController,
              decoration: InputDecoration(
                labelText: 'Customer ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Choose a service:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Al Jawhara Clearance Office'),
              leading: Radio<String>(
                value: 'Al Jawhara Clearance Office',
                groupValue: _selectedService,
                onChanged: (value) {
                  setState(() {
                    _selectedService = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('National Dates Company'),
              leading: Radio<String>(
                value: 'National Dates Company',
                groupValue: _selectedService,
                onChanged: (value) {
                  setState(() {
                    _selectedService = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_selectedService != null && _customerIdController.text.isNotEmpty) {
                  final waitingNumber = DateTime.now().millisecondsSinceEpoch % 1000;
                  await FirebaseFirestore.instance.collection('waiting_requests').add({
                    'customer_id': _customerIdController.text,
                    'service_type': _selectedService,
                    'waiting_number': waitingNumber,
                    'timestamp': Timestamp.now(),
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Waiting number assigned: $waitingNumber')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

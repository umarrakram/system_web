import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WaitingRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Waiting Requests')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('waiting_requests')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final requests = snapshot.data!.docs;

          if (requests.isEmpty) {
            return Center(child: Text('No waiting requests found.'));
          }

          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text('Customer ID: ${request['customer_id']}'),
                  subtitle: Text(
                    'Service: ${request['service_type']} - Waiting Number: ${request['waiting_number']}',
                  ),
                  trailing: Text(
                    (request['timestamp'] as Timestamp)
                        .toDate()
                        .toString()
                        .substring(0, 19),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

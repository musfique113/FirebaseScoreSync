import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore_firebase/match_details.dart';

class MatchList extends StatelessWidget {
  const MatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('livedata').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Use a centered CircularProgressIndicator
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data available.')); // Center the message
        }

        var matches = snapshot.data!.docs;
        return ListView.builder(
          itemCount: matches.length,
          itemBuilder: (context, index) {
            var match = matches[index];
            var matchName = match.get('match_name') ?? 'Default Match Name';
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  matchName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward), // Add a trailing arrow icon
                onTap: () {
                  Get.to(MatchDetails(match: match));
                },
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const UserInfoScreen({required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Name: $userName",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Email: $userEmail",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

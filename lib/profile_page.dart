import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  ProfilePage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(userData['name']),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(userData['username']),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(userData['email']),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(userData['phone']),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text(userData['address']),
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

// main_screen.dart
import 'package:flutter/material.dart';
import 'user.dart'; // Ensure this import is correct
import 'db_helper.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: FutureBuilder<User>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No user data available'));
          } else {
            User user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username: ${user.username}'),
                    Text('Phone: ${user.phone}'),
                    Text('Email: ${user.email}'),
                    Text('Address: ${user.address}'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<User> _fetchUserData() async {
    DBHelper dbHelper = DBHelper();
    return await dbHelper.getUser();
  }
}

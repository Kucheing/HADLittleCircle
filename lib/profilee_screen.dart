import 'package:flutter/material.dart';

class ProfileeScreen extends StatelessWidget {
  final String userId;
  final AppBar appBar;
  final List<Widget> actions;
  final List<Widget> children;

  ProfileeScreen({
    required this.userId,
    required this.appBar,
    required this.actions,
    required this.children,
  });

  // Define TextEditingController for each text box
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: $userId'),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save action
                String name = nameController.text;
                String email = emailController.text;
                // Save the data or perform any action
                print('Name: $name, Email: $email');
              },
              child: Text('Save'),
            ),
            ...children,
            ...actions,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/kConstants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Replace this with your actual user data
  final User _user = User(
    name: 'John Doe',
    email: 'john.doe@example.com',
    avatarUrl:
        'https://randomuser.me/api/portraits/men/1.jpg', // Sample avatar URL
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kSizedBoxH10,
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(_user.avatarUrl),
            ),
            kSizedBoxH10,
            Text(
              _user.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              _user.email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            kSizedBoxH20,
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              onTap: () {
                // Add your action here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Add your action here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy'),
              onTap: () {
                // Add your action here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Add your action here
              },
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String avatarUrl;

  User({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = 'profile-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              'Ini Profile Saya',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

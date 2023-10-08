import 'package:flutter/material.dart';

class OrganismScreen extends StatelessWidget {
  const OrganismScreen({super.key});
  static const String routeName = 'organism-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organism'),
      ),
      body: const Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              'Ini Organism Saya',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

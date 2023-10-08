import 'package:flutter/material.dart';

class MoleculesScreen extends StatelessWidget {
  const MoleculesScreen({super.key});
  static const String routeName = 'molecules-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Molecules'),
      ),
      body: const Center(
        child: Text('Molecules'),
      ),
    );
  }
}

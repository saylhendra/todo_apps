import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_preloved/atoms/typography/text_body1.dart';

import 'atoms/atom_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementNamed(AtomScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(),
          if (context.mounted) const TextBody1('Loading...'),
        ],
      )),
    );
  }
}

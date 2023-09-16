import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'SqAcademy',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Colors.purple,
        // ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // colorSchemeSeed: Colors.deepPurpleAccent,
        textTheme: GoogleFonts.workSansTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
    );
    // home: const WelcomeScreen(),
    // routes: {
    //   '/': (context) => const WelcomeScreen(),
    //   '/profile': (context) => const ProfileScreen(),
    // });
  }
}

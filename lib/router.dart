import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_preloved/profile_screen.dart';
import 'package:my_preloved/welcome_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
      ],
    ),
  ],
);

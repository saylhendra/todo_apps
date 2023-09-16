import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_preloved/pakai_riverpod/profile_screen.dart';
import 'package:my_preloved/polosan/todo_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        // return const WelcomeScreen(); // mau ke todo yg pakai state management
        return const TodoScreen(); // mau ke todo yg polosan
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

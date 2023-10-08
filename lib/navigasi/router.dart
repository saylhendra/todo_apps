import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_preloved/atomic_design_methodology/molecules_screen.dart';
import 'package:my_preloved/atoms/atom_screen.dart';

import '../atomic_design_methodology/organism_screen.dart';
import '../pakai_riverpod/profile_screen.dart';
import '../splash_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SplashScreen());
      },
    ),
    GoRoute(
      path: '/${AtomScreen.routeName}',
      name: AtomScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const AtomScreen();
      },
    ),
    GoRoute(
      path: '/${MoleculesScreen.routeName}',
      name: MoleculesScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const MoleculesScreen();
      },
    ),
    GoRoute(
      path: '/${OrganismScreen.routeName}',
      name: OrganismScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const OrganismScreen();
      },
    ),
    GoRoute(
      path: '/${ProfileScreen.routeName}',
      name: ProfileScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),
  ],
);

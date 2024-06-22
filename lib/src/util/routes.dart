import 'package:flutter/material.dart';
import '../src.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    observers: [routeObserver],
    routes: [
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const MeetAvaHome(),
          routes: [
            GoRoute(
              path: 'emp_disp',
              builder: (BuildContext context, GoRouterState state) =>
                  const EmploymentDisplayScreen(),
            ),
            GoRoute(
              path: 'emp_edit',
              builder: (BuildContext context, GoRouterState state) =>
                  const EmploymentEditScreen(),
            ),
          ]),
    ],
  );
}

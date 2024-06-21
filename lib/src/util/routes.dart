import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../src.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const MeetAvaHome(),
      ),
      GoRoute(
        path: '/emp_disp',
        builder: (BuildContext context, GoRouterState state) =>
            const EmploymentDisplayScreen(),
      ),
      GoRoute(
        path: '/emp_edit',
        builder: (BuildContext context, GoRouterState state) =>
            const EmploymentEditScreen(),
      ),
    ],
  );
}

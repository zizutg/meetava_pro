import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/ui/screens/employment_display_screen.dart';
import 'package:meetava_pro/src/ui/screens/employment_edit_screen.dart';
import 'package:meetava_pro/src/ui/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(child: MeetAvaApp()));
}

class MeetAvaApp extends StatelessWidget {
  MeetAvaApp({super.key});

  final GoRouter _router = GoRouter(
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade200),
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

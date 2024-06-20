import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/src.dart';
import 'package:meetava_pro/src/ui/screens/employment_display_screen.dart';
import 'package:meetava_pro/src/ui/screens/employment_edit_screen.dart';
import 'package:meetava_pro/src/ui/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(child: MeetAvaApp()));
}

class MeetAvaApp extends StatelessWidget {
  MeetAvaApp({super.key});

  final GoRouter _router = AppRoutes.router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Palette.lightGrey),
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

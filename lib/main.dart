import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/ui/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MeetAvaApp()));
}

class MeetAvaApp extends StatelessWidget {
  const MeetAvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meet Ava',
      debugShowCheckedModeBanner: false,
      home: MeetAvaHome(),
    );
  }
}

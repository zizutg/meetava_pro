import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmploymentEditScreen extends ConsumerWidget {
  const EmploymentEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen'),
      ),
      body: Container(),
    );
  }
}
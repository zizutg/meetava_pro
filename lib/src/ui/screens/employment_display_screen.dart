import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmploymentDisplayScreen extends ConsumerWidget {
  const EmploymentDisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TO-DO: Complete the screen with widget
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => GoRouter.of(context).push('/emp_edit'),
            child: Text('Edit')),
      ),
    );
  }
}

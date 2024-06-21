import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetava_pro/src/src.dart';

class EmploymentEditScreen extends ConsumerWidget {
  const EmploymentEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TO-DO: Complete the screen with widget
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Custom back icon
          onPressed: () {
            GoRouter.of(context).push('/emp_disp');
          },
        ),
        backgroundColor: Palette.lightGrey,
      ),
      body: Container(),
    );
  }
}

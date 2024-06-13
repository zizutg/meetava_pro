import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/providers/credit_card_factor_provider.dart';
import 'package:meetava_pro/src/ui/widgets/credit_factor_card.dart';
import 'package:meetava_pro/src/ui/widgets/base_header.dart';
import 'package:meetava_pro/src/ui/widgets/credit_score_widget.dart';
import 'package:meetava_pro/src/ui/widgets/section_header.dart';
import 'package:meetava_pro/src/util/color_palette.dart';

class MeetAvaHome extends ConsumerWidget {
  const MeetAvaHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditCardFactors = ref.watch(creditCardFactorNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          //shape: ROUNDED_RECTANGLE_BORDER,
          leading: IconButton(
              onPressed: () {
                // To do implement the route here
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              )),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Palette.deepPurple),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const BaseHeaderWidget(),
          const SectionHeader(title: 'Chart'),
          const CreditScoreWidget(),
          const SectionHeader(title: 'Credit factors'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: creditCardFactors.map((factor) {
                return CreditFactorCard(creditFactorModel: factor);
              }).toList(),
            ),
          ),
          const SectionHeader(title: 'Account details'),
          const SectionHeader(title: 'Open credit card accounts'),
        ],
      )),
    );
  }
}

class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

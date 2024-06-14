import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/providers/credit_card_factor_provider.dart';
import 'package:meetava_pro/src/ui/widgets/account_details_widget.dart';
import 'package:meetava_pro/src/ui/widgets/credit_factor_card.dart';
import 'package:meetava_pro/src/ui/widgets/base_header.dart';
import 'package:meetava_pro/src/ui/widgets/credit_score_widget.dart';
import 'package:meetava_pro/src/ui/widgets/section_header.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:go_router/go_router.dart';

class MeetAvaHome extends ConsumerWidget {
  const MeetAvaHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditCardFactors = ref.watch(creditCardFactorNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // To do implement the route here
                GoRouter.of(context).push('/emp_disp');
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
          const CreditScoreWidget(
            atBaseHeader: false,
          ),
          const SectionHeader(title: 'Credit factors'),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: creditCardFactors.map((factor) {
                return CreditFactorCard(creditFactorModel: factor);
              }).toList(),
            ),
          ),
          const SectionHeader(title: 'Account details'),
          const AccountDetailsWidget(),
          const SectionHeader(title: 'Open credit card accounts'),
        ],
      )),
    );
  }
}

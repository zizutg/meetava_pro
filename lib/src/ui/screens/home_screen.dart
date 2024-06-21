import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';
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
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const BaseHeaderWidget(),
              const SectionHeader(title: 'Chart'),
              const CreditScoreWidget(
                atBaseHeader: false,
              ),
              const SectionHeader(title: 'Credit factors'),
              SingleChildScrollView(
                padding: AppPadding.allMedium,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: creditCardFactors.map((factor) {
                    return CreditFactorCard(creditFactorModel: factor);
                  }).toList(),
                ),
              ),
              const SectionHeader(title: 'Account details'),
              const AccountDetailsWidget(),
              const CreditCardUtilization(),
              const SectionHeader(title: 'Open credit card accounts'),
              const OpenAccountsWidget(),
            ],
          )),
    );
  }
}

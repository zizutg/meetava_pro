import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';

class EmploymentDisplayScreen extends ConsumerWidget {
  const EmploymentDisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employmentProvider = ref.watch(employmentNotifierProvider);
    final employmentNotifier = ref.read(employmentNotifierProvider.notifier);
    final employmentMap = employmentProvider.toMap();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Custom back icon
          onPressed: () {
            GoRouter.of(context).push('/');
          },
        ),
        backgroundColor: Palette.lightGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPadding.allMedium,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Confirm your employment\n',
                  style: AppTextStyles.displayLarge
                      .copyWith(fontFamily: 'AtSlamCndTRIAL')),
              TextSpan(
                  text:
                      'Please review and confirm the below \nemployment details are up-to-date.',
                  style: AppTextStyles.titleMedium
                      .copyWith(color: Palette.lightPurple))
            ])),
          ),
          ListView(
            shrinkWrap: true,
            children: employmentMap.entries.map((entry) {
              String title = entry.key;
              String subtitle = employmentNotifier.formatedString(
                  title: entry.key,
                  subTitle: entry.value.toString()); //entry.value.toString();

              return _buildListTile(title, subtitle);
            }).toList(),
          ),
          const Spacer(),
          ElevatedTextButton(
              model: ElevetedTextButtonModel(
            text: 'Edit',
            onPressed: () => GoRouter.of(context).push('/emp_edit'),
            backgroundColor: Palette.lightGrey,
            borderColor: Palette.deepPurple,
            textColor: Palette.deepPurple,
            borderWidth: AppSizes.spaceXXS,
            borderRadius: AppSizes.spaceSmall,
          )),
          AppGaps.vSmallGap,
          ElevatedTextButton(
              model: ElevetedTextButtonModel(
            text: 'Confirm',
            onPressed: () {
              // Handle button press
            },
            backgroundColor: Palette.deepPurple,
            borderColor: Colors.transparent,
            textColor: Palette.white,
            borderWidth: AppSizes.spaceXXS,
            borderRadius: AppSizes.spaceSmall,
          )),
          AppGaps.vSmallGap,
        ],
      ),
    );
  }

  ListTile _buildListTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.bodyMedium.copyWith(color: Palette.lightPurple),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.titleLarge,
      ),
    );
  }
}

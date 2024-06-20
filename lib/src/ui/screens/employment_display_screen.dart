import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';

class EmploymentDisplayScreen extends ConsumerWidget {
  const EmploymentDisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employmentProvider = ref.watch(employmentNotifierProvider);
    final employmentMap = employmentProvider.toMap();

    return Scaffold(
      appBar: AppBar(title: const Text('Employment Details')),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: employmentMap.entries.map((entry) {
              return buildListTile(entry.key, entry.value.toString());
            }).toList(),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.lightGrey.withOpacity(1),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Palette.deepPurple,
                                width: AppSizes.spaceXXS),
                            borderRadius:
                                BorderRadius.circular(AppSizes.spaceSmall))),
                    onPressed: () {},
                    child: Padding(
                      padding: AppPadding.allSmall,
                      child: Text(
                        'Edit',
                        style: AppTextStyles.headlineSmall
                            .copyWith(color: Palette.deepPurple),
                      ),
                    ))),
          )
        ],
      ),
    );
  }

  ListTile buildListTile(String title, String subtitle) {
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

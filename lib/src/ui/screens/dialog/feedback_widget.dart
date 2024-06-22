import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../src.dart';

class FeedbackWidget extends StatelessWidget {
  final TextEditingController _feedbackController = TextEditingController();

  FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Palette.medPurple,
          borderRadius: BorderRadius.vertical(top: Radius.circular(75))),
      child: Padding(
        padding: const EdgeInsets.only(top: AppSizes.spaceMedium),
        child: Container(
          //color: Palette.lightGrey,
          width: double.infinity,
          padding: AppPadding.allSmall,
          decoration: const BoxDecoration(
              color: Palette.lightGrey,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSizes.spaceXL))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //AppGaps.vMedGap,
              Padding(
                padding: AppPadding.allSmall,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Give us feedback',
                            style: AppTextStyles.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                            onPressed: () =>
                                GoRouter.of(context).go('/emp_disp'),
                            icon: const Icon(
                              Icons.settings_outlined,
                              color: Palette.white,
                            ))
                      ],
                    ),
                    AppGaps.vMedGap,
                    TextField(
                      controller: _feedbackController,
                      maxLines: AppSizes.spaceSmall.toInt(),
                      decoration: InputDecoration(
                        hintText: 'It\'s been very helpful so far!',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppGaps.vMedGap,
              ElevatedTextButton(
                  buttonData: ElevetedTextButtonModel(
                text: 'Send feedback',
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                backgroundColor: Palette.deepPurple,
                borderColor: Colors.transparent,
                textColor: Palette.white,
                borderWidth: AppSizes.spaceXXS,
                borderRadius: AppSizes.spaceSmall,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

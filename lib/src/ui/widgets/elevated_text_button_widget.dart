import 'package:flutter/material.dart';
import '../../src.dart';

class ElevatedTextButton extends StatelessWidget {
  final ElevetedTextButtonModel model;

  const ElevatedTextButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalMedium,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: model.backgroundColor.withOpacity(1),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: model.borderColor,
                width: model.borderWidth,
              ),
              borderRadius: BorderRadius.circular(model.borderRadius),
            ),
          ),
          onPressed: model.onPressed,
          child: Padding(
            padding: AppPadding.allSmall,
            child: Text(
              model.text,
              style:
                  AppTextStyles.headlineSmall.copyWith(color: model.textColor),
            ),
          ),
        ),
      ),
    );
  }
}

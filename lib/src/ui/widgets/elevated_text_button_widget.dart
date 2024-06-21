import 'package:flutter/material.dart';
import '../../src.dart';

class ElevatedTextButton extends StatelessWidget {
  final ElevetedTextButtonModel buttonData;

  const ElevatedTextButton({super.key, required this.buttonData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: buttonData.padding,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonData.backgroundColor.withOpacity(1),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: buttonData.borderColor,
                width: buttonData.borderWidth,
              ),
              borderRadius: BorderRadius.circular(buttonData.borderRadius),
            ),
          ),
          onPressed: buttonData.onPressed,
          child: Padding(
            padding: AppPadding.allSmall,
            child: Text(
              buttonData.text,
              style: AppTextStyles.headlineSmall
                  .copyWith(color: buttonData.textColor),
            ),
          ),
        ),
      ),
    );
  }
}

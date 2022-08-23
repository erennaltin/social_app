import 'package:flutter/material.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: body.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

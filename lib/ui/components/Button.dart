import 'package:flutter/material.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

import '../../core/constants/color_constants.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
      this.type = "Normal",
      required this.text,
      required this.onPressed})
      : super(key: key);

  final String type, text;
  late ButtonStyle style;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "Normal":
        {
          style = _normal;
          break;
        }
      case "Secondary":
        {
          style = _secondary;
          break;
        }
      default:
        {
          style = _normal;
          break;
        }
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: standartPadding),
        child: Text(text, style: headline3),
      ),
    );
  }

  final ButtonStyle _normal = ElevatedButton.styleFrom(
    primary: accentBlue,
    onPrimary: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(standartRadius * (3 / 4)),
    ),
  );

  final ButtonStyle _secondary = ElevatedButton.styleFrom(
    primary: extraWhite,
    onPrimary: accentBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(standartRadius * (3 / 4)),
    ),
  );
}

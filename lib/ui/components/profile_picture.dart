import 'package:flutter/material.dart';
import 'package:social_app/core/constants/color_constants.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: accentBlue10, width: 1),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

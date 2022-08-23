import 'package:flutter/material.dart';
import 'package:social_app/core/theme/light_theme.dart';
import 'package:social_app/ui/onboarding/sign_in/sign_in.dart';
import 'package:social_app/ui/onboarding/sign_up/sign_up_phone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignUpPhoneScreen(),
      theme: buildLightTheme(),
    );
  }
}

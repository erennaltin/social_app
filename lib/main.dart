import 'package:flutter/material.dart';
import 'package:social_app/core/blocs/bloc/user_bloc.dart';
import 'package:social_app/core/models/user.dart';
import 'package:social_app/core/theme/light_theme.dart';
import 'package:social_app/ui/app/app.dart';
import 'package:social_app/ui/onboarding/first_screen/first_screen.dart';
import 'package:social_app/ui/onboarding/sign_in/sign_in.dart';
import 'package:social_app/ui/onboarding/sign_up/sign_up.dart';
import 'package:social_app/ui/onboarding/sign_up/sign_up_phone.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()..add(InitializeUser()))
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: FirstScreen(),
          theme: buildLightTheme(),
          initialRoute: "/AppScreen",
          routes: {
            '/FirstScreen': (context) => FirstScreen(),
            '/SignInScreen': (context) => SignInScreen(),
            '/SignUpScreen': (context) => SignUpScreen(),
            '/AppScreen': (context) => AppScreen(),
          }),
    );
  }
}

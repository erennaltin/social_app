import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/Button.dart';
import 'package:social_app/ui/components/Input.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/back.svg"),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: standartPadding * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: standartPadding)),
                    Text(
                      "Let’s sign you in.",
                      style: headline1.copyWith(
                        color: dark,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: standartPadding)),
                    Text(
                      "Welcome back to your workspace!",
                      style: headline1.copyWith(
                        color: dark60,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: standartPadding * 3),
                    ),
                    Expanded(
                      child: SignInForm(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

// Define a custom Form widget.
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isSignInActive = false;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(_handleInputChange);
    _passwordController.addListener(_handleInputChange);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleInputChange() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSignInActive = true;
      });
    } else {
      setState(() {
        isSignInActive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Input(inputType: "Email", controller: _emailController),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding),
          ),
          Input(inputType: "Password", controller: _passwordController),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding / 2),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CustomTextButton(
                text: "Forgot your password?", onPressed: () {}),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: standartPadding),
            child: Row(
              children: [
                Text("Don’t have an account?",
                    style: bodySmaller.copyWith(color: dark)),
                Spacer(),
                Text("|", style: bodySmaller.copyWith(color: secondaryActive)),
                Spacer(),
                CustomTextButton(text: "Register", onPressed: () {})
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: standartPadding)),
          Button(
              text: "Sign In", onPressed: () {}, isDisabled: !isSignInActive),
          Padding(padding: EdgeInsets.only(bottom: standartPadding * 4))
        ],
      ),
    );
  }
}

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

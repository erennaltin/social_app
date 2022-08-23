import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';

class Input extends StatefulWidget {
  Input({
    Key? key,
    required this.inputType,
    required this.controller,
  }) : super(key: key);

  final String inputType;
  final TextEditingController controller;

  late InputDecoration _decoration;
  late TextInputType _keyboardType;
  late String? Function(String? validator)? _validator;

  bool isPassword = false;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    var _emailDecoration = const InputDecoration(
      labelText: 'Email',
      hintText: "Phone, email or username",
    );

    var _passwordDecoration = InputDecoration(
        labelText: 'Password',
        hintText: "Password",
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: SvgPicture.asset("assets/svgs/additions.svg",
                color: isObscure ? dark30 : accentBlue)));

    switch (widget.inputType) {
      case "Email":
        {
          widget._decoration = _emailDecoration;
          widget._keyboardType = TextInputType.emailAddress;
          widget._validator = (value) {
            if (value != null) {
              if (!value.contains('@') || !value.contains('.com')) {
                return "Please enter a valid email address.";
              }
            }
            return null;
          };
          break;
        }
      case "Password":
        {
          widget._decoration = _passwordDecoration;
          widget._keyboardType = TextInputType.visiblePassword;
          widget.isPassword = true;
          widget._validator = (value) {
            if (value != null) {
              if (value.length < 3) {
                return "You need to enter a password.";
              }
            }
            return null;
          };
          break;
        }
      default:
        {
          widget._decoration = _emailDecoration;
          widget._keyboardType = TextInputType.emailAddress;
          widget._validator = (value) {};
          break;
        }
    }

    return TextFormField(
      validator: widget._validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword ? isObscure : false,
      autocorrect: widget.isPassword,
      enableSuggestions: widget.isPassword,
      decoration: widget._decoration,
      keyboardType: widget._keyboardType,
      controller: widget.controller,
    );
  }
}

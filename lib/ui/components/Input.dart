import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';

import '../../core/blocs/bloc/user_bloc.dart';
import '../../core/enums/phone_code.dart';

class Input extends StatefulWidget {
  Input({
    Key? key,
    required this.inputType,
    required this.controller,
    this.isValid = false,
    this.isValidating = false,
  }) : super(key: key);

  final String inputType;
  final TextEditingController controller;

  late InputDecoration _decoration;
  late TextInputType _keyboardType;
  var _inputFormatters = <TextInputFormatter>[];
  late String? Function(String? validator)? _validator;

  bool isPassword = false;
  final bool isValid;
  final bool isValidating;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _isObscure = true;
  PhoneCode _country = PhoneCode.tr;
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
            _isObscure = !_isObscure;
          });
        },
        icon: SvgPicture.asset("assets/svgs/additions.svg",
            color: _isObscure ? dark30 : accentBlue),
      ),
    );

    var _phoneDecoration = InputDecoration(
        labelText: 'Mobile Phone',
        hintText: "Mobile Phone",
        prefixIcon: IconButton(
          onPressed: () {},
          icon: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              var phoneCodes = PhoneCode.values
                  .toList()
                  .map((e) => e.toString().split('.').elementAt(1))
                  .toList();

              return DropdownButton<PhoneCode>(
                value: _country,
                elevation: 16,
                onChanged: (value) {
                  context
                      .read<UserBloc>()
                      .add(SetPhoneCode(value ?? PhoneCode.tr));
                  setState(() {
                    _country = value ?? PhoneCode.tr;
                  });
                },
                icon: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                items: PhoneCode.values
                    .map<DropdownMenuItem<PhoneCode>>((PhoneCode value) {
                  return DropdownMenuItem<PhoneCode>(
                    value: value,
                    child: SvgPicture.asset(
                        'icons/flags/svg/${value.toString().split('.').elementAt(1)}.svg',
                        package: 'country_icons',
                        height: 16,
                        width: 16),
                  );
                }).toList(),
              );
            },
          ),
        ));

    var _usernameDecoration = InputDecoration(
      labelText: 'Username',
      hintText: "username",
      suffixIcon: Padding(
          padding: EdgeInsets.all(standartPadding),
          child: widget.isValidating
              ? SizedBox(
                  width: standartPadding,
                  height: standartPadding,
                  child: CircularProgressIndicator(strokeWidth: 4))
              : widget.isValid
                  ? SvgPicture.asset(
                      'assets/svgs/valid_username.svg',
                    )
                  : null),
    );

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
      case "Phone":
        {
          widget._decoration = _phoneDecoration;
          widget._keyboardType = TextInputType.phone;
          widget._inputFormatters = [
            LengthLimitingTextInputFormatter(10),
          ];
          widget._validator = (value) {
            if (value != null) {
              if (value.isNotEmpty) {
                if (value.length != 10) {
                  return "Enter a valid phone number!";
                }
              }
            }
            return null;
          };
          break;
        }
      case "Username":
        {
          widget._decoration = _usernameDecoration;
          widget._keyboardType = TextInputType.text;
          widget._validator = (value) {
            if (value != null) {
              if (value.length < 8) {
                return "You need to enter a username.";
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
      obscureText: widget.isPassword ? _isObscure : false,
      autocorrect: !widget.isPassword,
      enableSuggestions: widget.isPassword,
      decoration: widget._decoration,
      keyboardType: widget._keyboardType,
      controller: widget.controller,
      inputFormatters: widget._inputFormatters,
    );
  }
}

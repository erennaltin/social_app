import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import '../enums/phone_code.dart';

part 'user.g.dart';

@CopyWith()
class User extends Equatable {
  String username;
  String email;
  String phoneNumber;
  PhoneCode phoneCode;
  String password;

  User({
    this.username = "",
    this.email = "",
    this.phoneNumber = "",
    this.phoneCode = PhoneCode.tr,
    this.password = "",
  });

  @override
  List<Object?> get props =>
      [username, email, phoneNumber, phoneCode, password];

  static User user = User();
}

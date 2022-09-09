enum PhoneCode { tr, us, gb }

extension PhoneCodeX on PhoneCode {
  String? get getPhoneCode {
    switch (this) {
      case PhoneCode.tr:
        return "+90";
      case PhoneCode.us:
        return "+1";
      case PhoneCode.gb:
        return "+44";
      default:
        return "+0";
    }
  }
}

part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class InitializeUser extends UserEvent {
  @override
  List<Object> get props => [];
}

class SetUser extends UserEvent {
  final User user;

  SetUser(this.user);

  @override
  List<Object> get props => [user];
}

class SetUserName extends UserEvent {
  final String usernameInput;

  SetUserName(this.usernameInput);

  @override
  List<Object> get props => [usernameInput];
}

class SetPhoneNumber extends UserEvent {
  final String phoneNumberInput;

  SetPhoneNumber(this.phoneNumberInput);

  @override
  List<Object> get props => [phoneNumberInput];
}

class SetPhoneCode extends UserEvent {
  final PhoneCode phoneCodeInput;

  SetPhoneCode(this.phoneCodeInput);

  @override
  List<Object> get props => [phoneCodeInput];
}

class SetPassword extends UserEvent {
  final String passwordInput;

  SetPassword(this.passwordInput);

  @override
  List<Object> get props => [passwordInput];
}

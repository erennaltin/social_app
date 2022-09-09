import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../enums/phone_code.dart';
import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<InitializeUser>((event, emit) {
      User user = User();

      emit(UserLoaded(user: user));
    });

    on<SetUser>(
      (event, emit) {
        emit(UserLoaded(user: event.user));
      },
    );

    on<SetUserName>((event, emit) {
      if (state is UserLoaded) {
        final state = this.state as UserLoaded;
        User user = state.user.copyWith(username: event.usernameInput);
        emit(UserLoaded(user: user));
      }
    });

    on<SetPhoneNumber>((event, emit) {
      if (state is UserLoaded) {
        final state = this.state as UserLoaded;
        User user = state.user.copyWith(phoneNumber: event.phoneNumberInput);
        emit(UserLoaded(user: user));
      }
    });

    on<SetPhoneCode>((event, emit) {
      if (state is UserLoaded) {
        final state = this.state as UserLoaded;
        User user = state.user.copyWith(phoneCode: event.phoneCodeInput);
        emit(UserLoaded(user: user));
      }
    });

    on<SetPassword>((event, emit) {
      if (state is UserLoaded) {
        final state = this.state as UserLoaded;
        User user = state.user.copyWith(password: event.passwordInput);
        emit(UserLoaded(user: user));
      }
    });
  }
}

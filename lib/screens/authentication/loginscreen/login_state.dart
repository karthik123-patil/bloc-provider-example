import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'auth_model/email.dart';
import 'auth_model/mobile.dart';
import 'auth_model/password.dart';

class LoginState extends Equatable {
  const LoginState({
    this.mobile = const Mobile.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError,
  });

  final Mobile mobile;
  final Password password;
  final FormzStatus status;
  final String? exceptionError;

  @override
  List<Object> get props => [mobile, password, status, exceptionError.toString()];

  LoginState copyWith({
    Mobile? mobile,
    Password? password,
    FormzStatus? status,
    String? error,
  }) {
    return LoginState(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
    );
  }
}
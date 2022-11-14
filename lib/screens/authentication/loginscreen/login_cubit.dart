import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:practice/data/ApiProvider.dart';
import 'package:practice/data/model/login_response.dart';
import 'package:practice/screens/authentication/loginscreen/auth_model/mobile.dart';
import 'package:practice/utils/AppUtils.dart';
import 'auth_model/email.dart';
import 'auth_model/password.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(exceptionError: 'Invalid'));

  /*void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password
      ]),
    ));
  }*/

  void mobileChanged(String value) {
    final mobile = Mobile.dirty(value);
    emit(state.copyWith(
      mobile: mobile,
      status: Formz.validate([
        mobile,
        state.password
      ])
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.mobile,
        password
      ]),
    ));
  }

  Future<void> logInWithCredentials(BuildContext context) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      ApiProvider().userLogin(state.mobile.value, state.password.value).then((LoginResponse value) async {
        if(value.success == true){
          AppUtils().showSuccessToastMsg(value.message.toString(), context);
          Navigator.of(context).pushNamed('/articleList');
        }else{
          AppUtils().showErrorToastMsg(value.message.toString());
        }
      });
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure, error: e.toString()));
    }
  }
}
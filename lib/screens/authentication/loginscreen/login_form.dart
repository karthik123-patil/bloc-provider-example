import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/auth_text_field.dart';
import 'login_cubit.dart';
import 'login_state.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            debugPrint('submission failure');
          } else if (state.status.isSubmissionSuccess) {
            debugPrint('success');
          }
        },
        builder: (context, state) => Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const _WelcomeText(),
                    _EmailInputField(),
                    _PasswordInputField(),
                    const _LoginButton(),
                    const _SignUpButton(),
                  ],
                ),
              ),
            ),
            state.status.isSubmissionInProgress
                ? const Positioned(
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            ) : Container(),
          ],
        )
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
      child: Text(
        'Welcome to Bloc tutorial!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class _EmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.mobile != current.mobile,
      builder: (context, state) {
        if(state.mobile.error?.name != null) {
          return AuthTextField(
          hint: 'Mobile',
          key: const Key('loginForm_mobileInput_textField'),
          keyboardType: TextInputType.number,
          error: state.mobile.error!.name,
            isRequiredField: true,
          onChanged: (email) => context.read<LoginCubit>().mobileChanged(email),
        );
        }else{
          return AuthTextField(
            hint: 'Mobile',
            key: const Key('loginForm_mobileInput_textField'),
            keyboardType: TextInputType.number,
            error: "",
            isRequiredField: true,
            onChanged: (email) => context.read<LoginCubit>().mobileChanged(email),
          );
        }
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        if(state.password.error?.name != null) {
          return AuthTextField(
          padding: const EdgeInsets.symmetric(vertical: 20),
          hint: 'Password',
          isPasswordField: true,
            isRequiredField: true,
          key: const Key('loginForm_passwordInput_textField'),
          keyboardType: TextInputType.text,
          error: state.password.error?.name,
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
        );
        }else {
          return AuthTextField(
            padding: const EdgeInsets.symmetric(vertical: 20),
            hint: 'Password',
            isPasswordField: true,
            isRequiredField: true,
            key: const Key('loginForm_passwordInput_textField'),
            keyboardType: TextInputType.text,
            error: "",
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
          );
        }
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            disabledColor: Colors.blueAccent.withOpacity(0.6),
            color: Colors.blueAccent,
            onPressed: state.status.isValidated
                ? () => context.read<LoginCubit>().logInWithCredentials(context)
                : null,
            child: const Text('Login'),
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.only(top: 30),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            onPressed: null,
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
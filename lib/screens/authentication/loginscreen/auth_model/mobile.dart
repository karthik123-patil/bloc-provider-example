import 'package:formz/formz.dart';

enum MobileValidationError { invalid , empty, tenDigit }



class Mobile extends FormzInput<String, MobileValidationError> {
  const Mobile.pure() : super.pure('');
  const Mobile.dirty([String value = '']) : super.dirty(value);


  @override
  MobileValidationError? validator(String value) {
    if (value.isEmpty) {
      return MobileValidationError.empty;
    }else if(value.length != 10) {
      return MobileValidationError.tenDigit;
    }
    return null;

  }
}

extension Explanation on MobileValidationError {
  String get name {
    switch(this) {
      case MobileValidationError.empty:
        return "Please enter mobile no";
      case MobileValidationError.tenDigit:
        return "Please enter 10 digit mobile no";
      case MobileValidationError.invalid:
        return "Invalid";

    }
  }
}
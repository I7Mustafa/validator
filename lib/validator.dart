library validator;

import 'validate/custom_validate.dart';

class Validator {
  static String? passwordValidate(String? value) {
    final passwordValidator = CustomValidate.validatePassword(value);
    if (passwordValidator == null) {
      return null;
    } else {
      return passwordValidator;
    }
  }

  static String? restrictedValidatePassword(String? value) {
    final passwordValidator = CustomValidate.restrictedValidatePassword(value);
    if (passwordValidator == null) {
      return null;
    } else {
      return passwordValidator;
    }
  }

  static String? passwordConfirmValidate(String? value, String? confirmValue) {
    final passwordValidator =
        CustomValidate.validatePassword(value, confirmPassword: confirmValue);
    if (passwordValidator == null) {
      return null;
    } else {
      return passwordValidator;
    }
  }

  static String? emailValidate(String? value) {
    final emailValidator = CustomValidate.validateEmail(value);
    if (emailValidator == null) {
      return null;
    } else {
      return emailValidator;
    }
  }

  static String? phoneValidate(String? value) {
    final phoneValidator = CustomValidate.validatePhoneNumber(value);
    if (phoneValidator == null) {
      return null;
    } else {
      return phoneValidator;
    }
  }

  static String? nameValidate(String? value) {
    final nameValidator = CustomValidate.validateName(value);
    if (nameValidator == null) {
      return null;
    } else {
      return nameValidator;
    }
  }

  static bool isValidFullName(String name) {
    return name.contains(' ');
  }

  static String? creditValidate(String? value) {
    final validator = CustomValidate.validateCreditCardNumber(value);
    if (validator == null) {
      return null;
    } else {
      return validator;
    }
  }

  static String? cvvValidate(String? value) {
    final validator = CustomValidate.validateCVV(value);
    if (validator == null) {
      return null;
    } else {
      return validator;
    }
  }

  static String? isEmptyText(String? value) {
    if (value!.isEmpty) {
      return " ";
    }
    return null;
  }

  static String? dateValidate(String? value) {
    final validator = CustomValidate.validateDate(value);
    if (validator == null) {
      return null;
    } else {
      return validator;
    }
  }
}

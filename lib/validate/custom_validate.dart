class CustomValidate {
  static String? validateName(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Please enter name';
    }

    if (value.length < 2) {
      return 'Please enter name minimum 3 characters ';
    }
    return null;
  }

  static String? validateEmail(String? value, {String? error}) {
    if (value == null) return null;
    if (value.isEmpty) {
      return "Please enter email";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) return 'Enter Valid Email';

    if (error != null) return error;

    return null;
  }

  static String? validateSelectCountry(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Please select country';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    var regExp = RegExp(regexPattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length <= 10) {
      return 'Please enter with number minimum 10';
    }
    if (!value.startsWith("0")) {
      return 'Please enter a valid phone number';
    }
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validatePassword(String? value, {String? confirmPassword}) {
    if (value == null) {
      return null;
    }
    if (confirmPassword != null && value != confirmPassword) {
      return "Password are not matching";
    }
    if (value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  static String? restrictedValidatePassword(String? value,
      {String? confirmPassword}) {
    if (value != null) {
      final pattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
          .hasMatch(value);
      if (pattern) {
        return null;
      } else {
        return "Your password must contain at least; one capital, one small case letter, one number & 8 characters";
      }
    }
    return null;
  }

  static String? validateCreditCardNumber(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please Enter A Valid Credit Number";
    // final pattern = RegExp(r"\s+");
    // if (!pattern.hasMatch(value)) return "Please enter valid credit";
    return null;
  }

  static String? validateCVV(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "enter Valid CVV";
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return " ";
    if (value.length < 2) return " ";
    return null;
  }
}

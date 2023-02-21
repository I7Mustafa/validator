library validator;

class Validator {
  static String? name(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Please Enter Name';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? email(String? value, {String? customMessage}) {
    if (value == null) return null;
    if (value.isEmpty) {
      return customMessage ?? "Please enter email";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) return customMessage ?? 'Enter Valid Email';

    return null;
  }

  static String? selectCountry(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Please select country';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
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

  static String? password(String? value, {String? confirmPassword}) {
    if (value == null) {
      return null;
    }
    if (confirmPassword != null && value != confirmPassword) {
      return "Password not match";
    }
    if (value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  static String? restrictedPassword(
    String? value, {
    String? confirmPassword,
  }) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "password can not be empty";
    }
    if (confirmPassword != null && value != confirmPassword) {
      return "Password not match";
    }
    final pattern = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    ).hasMatch(value);
    if (pattern) {
      return null;
    } else {
      return "Your password must contain at least one capital, one small case letter, one number and 8 characters";
    }
  }

  static String? creditCardNumber(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter credit card number";
    if (value.length < 16) return "Please enter with number minimum 16";
    return null;
  }

  static String? cVV(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter cvv";
    if (value.length < 3) return "Please enter with number minimum 3";
    if (value.length > 3) return "Please enter with number maximum 3";
    return null;
  }
}

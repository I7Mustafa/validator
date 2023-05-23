library validator;

class Validator {
  static String? name(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Please Enter Your Name';
    }

    return null;
  }

  static String? email(String? value, {String? customMessage}) {
    if (value == null) return null;
    if (value.isEmpty) {
      return customMessage ?? "Please enter your email";
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

  static String? password(String? value, {String? confirmPassword}) {
    if (value == null) {
      return null;
    }
    if (confirmPassword != null && value != confirmPassword) {
      return "Passwords don't match";
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
      return "Password can't be empty";
    }
    if (confirmPassword != null && value != confirmPassword) {
      return "Passwords don't match";
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
}

import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  group(
    "Validate name",
    () {
      test(
        "return error message if the name is empty",
        () {
          final result = Validator.name("");
          expect(result, "Please Enter Your Name");
        },
      );

      test(
        "return nothing aka:null if name entered with more than 3 characters",
        () {
          final result = Validator.name("abc");
          expect(result, null);
        },
      );

      test(
        "return nothing aka:null if name did not entered yet",
        () {
          final result = Validator.name(null);
          expect(result, null);
        },
      );
    },
  );

  group(
    "Validate email",
    () {
      test(
        "return error message if the email is empty",
        () {
          final result = Validator.email("");
          expect(result, "Please enter your email");
        },
      );

      test(
        "return error message if the email is incorrect",
        () {
          final result = Validator.email("abc");
          expect(result, "Enter Valid Email");
        },
      );

      test(
        "return nothing aka:null if the email is entered and correct",
        () {
          final result = Validator.email("abc@gmail.com");
          expect(result, null);
        },
      );

      test(
        "return nothing aka:null if the email did not entered yet",
        () {
          final result = Validator.email(null);
          expect(result, null);
        },
      );

      test(
        "return custom message if the email entered is incorrect and we did provide a custom message",
        () {
          final result = Validator.email("abc", customMessage: "abc");
          expect(result, "abc");
        },
      );

      test(
        "return nothing aka:null if the email is entered and correct even if we entered a custom message error",
        () {
          final result = Validator.email("abc@gmail.com", customMessage: "abc");
          expect(result, null);
        },
      );
    },
  );

  group(
    "Validate country",
    () {
      test(
        "return error message if the country is empty",
        () {
          final result = Validator.selectCountry("");
          expect(result, "Please select country");
        },
      );

      test(
        "return nothing aka:null if the country is entered",
        () {
          final result = Validator.selectCountry("abc");
          expect(result, null);
        },
      );

      test(
        "return nothing aka:null if the country did not entered yet",
        () {
          final result = Validator.selectCountry(null);
          expect(result, null);
        },
      );
    },
  );

  group(
    "Validate Password",
    () {
      test(
        "return null if password did not entered yet",
        () {
          final result = Validator.password(null);
          expect(result, null);
        },
      );

      test(
        "return error message if password is empty",
        () {
          final result = Validator.password("");
          expect(result, "Please enter password");
        },
      );

      test(
        "return null if the password is correct",
        () {
          final result = Validator.password("123456");
          expect(result, null);
        },
      );

      test(
        "return null if the password entered and equal to confirm password",
        () {
          final result = Validator.password("abs", confirmPassword: "abs");
          expect(result, null);
        },
      );

      test(
        "return error message if the password entered and not equal to confirm password",
        () {
          final result = Validator.password("abs", confirmPassword: "abcd");
          expect(result, "Passwords don't match");
        },
      );
    },
  );

  group(
    "validate password is strong",
    () {
      test(
        "return null if password did not entered yet",
        () {
          final result = Validator.restrictedPassword(null);
          expect(result, null);
        },
      );

      test(
        "return error message if password is empty",
        () {
          final result = Validator.restrictedPassword("");
          expect(result, "Password can't be empty");
        },
      );

      test(
        "return error in confirm password if it does not equal to password",
        () {
          final result = Validator.restrictedPassword(
            "abs",
            confirmPassword: "abcd",
          );
          expect(result, "Passwords don't match");
        },
      );

      test(
        "return error if the password is week",
        () {
          String error =
              "Your password must contain at least one capital, one small case letter, one number and 8 characters";
          final result = Validator.restrictedPassword("1234567");
          expect(result, error);
        },
      );

      test(
        "return null if the password is strong",
        () {
          final result = Validator.restrictedPassword("1234567asAS");
          expect(result, null);
        },
      );
    },
  );
}

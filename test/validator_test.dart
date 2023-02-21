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
          expect(result, "Please Enter Name");
        },
      );

      test(
        "return error message if name entered with less than 3 characters",
        () {
          final result = Validator.name("ab");
          expect(result, "Name must be at least 3 characters");
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
          expect(result, "Please enter email");
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
    "Validate phone number",
    () {
      test(
        "return error message if the phone number is empty",
        () {
          final result = Validator.phoneNumber("");
          expect(result, "Please enter a phone number");
        },
      );

      test(
        "return error message if the phone number is less than 10 characters",
        () {
          final result = Validator.phoneNumber("123456789");
          expect(result, "Please enter with number minimum 10");
        },
      );

      test(
        "return error message if the phone number is not start with 0",
        () {
          final result = Validator.phoneNumber("12345678901");
          expect(result, "Please enter a valid phone number");
        },
      );

      test(
        "return error message if the phone number is not correct",
        () {
          final result = Validator.phoneNumber("019h3456789");
          expect(result, "Please enter a valid phone number");
        },
      );

      test(
        "return nothing aka:null if the phone number is entered and correct",
        () {
          final result = Validator.phoneNumber("01934567890");
          expect(result, null);
        },
      );

      test(
        "return nothing aka:null if the phone number did not entered yet",
        () {
          final result = Validator.phoneNumber(null);
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
          expect(result, "Password not match");
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
          expect(result, "password can not be empty");
        },
      );

      test(
        "return error in confirm password if it does not equal to password",
        () {
          final result = Validator.restrictedPassword(
            "abs",
            confirmPassword: "abcd",
          );
          expect(result, "Password not match");
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

  group(
    "validate credit card number",
    () {
      test(
        "return null if credit card number did not entered yet",
        () {
          final result = Validator.creditCardNumber(null);
          expect(result, null);
        },
      );

      test(
        "return error message if credit card number is empty",
        () {
          final result = Validator.creditCardNumber("");
          expect(result, "Please enter credit card number");
        },
      );

      test(
        "return error message if credit card number is less than 16 characters",
        () {
          final result = Validator.creditCardNumber("123456789012345");
          expect(result, "Please enter with number minimum 16");
        },
      );

      test(
        "return nothing aka:null if the credit card number is entered and correct",
        () {
          final result = Validator.creditCardNumber("1234567890123456");
          expect(result, null);
        },
      );
    },
  );

  group(
    "validate cvv",
    () {
      test(
        "return null if cvv did not entered yet",
        () {
          final result = Validator.cVV(null);
          expect(result, null);
        },
      );

      test(
        "return error message if cvv is empty",
        () {
          final result = Validator.cVV("");
          expect(result, "Please enter cvv");
        },
      );

      test(
        "return error message if cvv is less than 3 characters",
        () {
          final result = Validator.cVV("12");
          expect(result, "Please enter with number minimum 3");
        },
      );

      test(
        "return error message if cvv is more than 3 characters",
        () {
          final result = Validator.cVV("12345");
          expect(result, "Please enter with number maximum 3");
        },
      );

      test(
        "return nothing aka:null if the cvv is entered and correct",
        () {
          final result = Validator.cVV("123");
          expect(result, null);
        },
      );
    },
  );
}

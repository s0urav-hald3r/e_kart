// ignore_for_file: prefer_adjacent_string_concatenation

class Validators {
  static choose(String validatorText, String? text) {
    switch (validatorText) {
      case 'email':
        if (text == null || text.isEmpty) {
          return "Email address is required";
        }
        // This is just a regular expression for email addresses
        // ignore: unnecessary_string_escapes
        String p =
            "[a-zA-Z0-9+._%-+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
        RegExp regExp = RegExp(p);
        if (regExp.hasMatch(text)) {
          // So, the email is valid
          return null;
        }
        // The pattern of the email didn't match the regex above.
        return 'Email is not valid';

      case 'phone':
        if (text == null || text.isEmpty) {
          return '*Required field';
        }

        if (text.length != 10) {
          return 'Invalid Phone Number';
        }

        return null;

      default:
    }
  }
}

abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordvalidator {
  final StringValidator emailvalidator = NonEmptyStringValidator();
  final StringValidator passwordvalidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email can\'t be empty';
  final String invalidPasswordErrorText = 'Password can\'t be empty';
}

class Validation {
  static String PasswordValidation(password) {
    if (password.isEmpty) {
      return 'This field must not be empty';
    }
    if (!password.contains(RegExp('[0-9]')) ||
        !password.contains(RegExp('[a-z]'))) {
      return 'Password must contain letters and nubmers';
    }
    if (password.length < 8) {
      return 'Password must not have less than 8 characters';
    }

    return null;
  }

  static String NameValidation(value) {
    if (value.isEmpty) {
      return 'Name is required.';
    }
    return null;
  }

  static String EmailValidation(value) {
    if (value.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(
            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }

    // validator has to return something :)
    return null;
  }

  static String PhoneValidation(value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  static String UrlValidation(value) {
    if (value.isEmpty) {
      return 'URL is required';
    }
    return null;
  }

  static String AgeValidation(value) {
    int age = int.tryParse(value);
    if (age == null || age <= 0) {
      return 'Age must be greater then 0';
    }
    return null;
  }
}

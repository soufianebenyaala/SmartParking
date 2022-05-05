class Validation {
  static String validatePassword(password) {
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

  static String validateName(value) {
    if (value.isEmpty) {
      return 'Name is required.';
    }
    return null;
  }

  static String validateEmail(value) {
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

  static String validatePhone(value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  static String validateUrl(value) {
    if (value.isEmpty) {
      return 'URL is required';
    }
    return null;
  }

  static String validateAge(value) {
    int age = int.tryParse(value);
    if (age == null || age <= 0) {
      return 'Age must be greater then 0';
    }
    return null;
  }

  static String validateNameWithLetterOnly(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String _validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }
}

extension Validators on String {
  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isNotEmpty(String value) {
    return value.isNotEmpty;
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isNumber(String value) {
    return double.tryParse(value.replaceFirst(',', '.')) != null;
  }

  static bool isInteger(String value) {
    return int.tryParse(value) != null;
  }

  static String? fieldRequired(String? field) {
    if (field!.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (!isNotEmpty(value!)) {
      return 'Email is required';
    } else if (!isValidEmail(value)) {
      return 'Must be a valid email';
    }
    return null;
  }

  static String? numberRequired(String? value) {
    if (!isNotEmpty(value!)) {
      return 'Field is required';
    } else if (!isNumber(value)) {
      return 'Must be a number';
    }
    return null;
  }

  static String? numberWithLimit(String? value, int maxValue) {
    if (!isNotEmpty(value!)) {
      return 'Field is required';
    } else if (!isNumber(value)) {
      return 'Must be a number';
    } else if (double.parse(value).ceil() > maxValue) {
      return 'Price cannot be greater than $maxValue€';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (!isNotEmpty(value!)) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must have 8 characters';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must have a uppercase';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must have a number';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must have a lowercase';
    } else if (!value.contains(RegExp(r'[#?!@$%^&*-]'))) {
      return 'Password must have a special character e.g #?!@\$%^&*-';
    }

    return null;
  }

  static String? intNumberNotzeroWithLimit(String? value, int maxValue) {
    if (!isNotEmpty(value!)) {
      return 'Field is required';
    } else if (!isInteger(value)) {
      return 'Must be a number';
    } else if (int.parse(value) == 0) {
      return 'Must be greater than 0';
    } else if (double.parse(value).ceil() > maxValue) {
      return 'Price cannot be greater than $maxValue%';
    }
    return null;
  }
}

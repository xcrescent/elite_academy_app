class FormValidators {
  static String? requiredField(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return fieldName != null
          ? 'Please enter $fieldName'
          : 'Please fill required fields';
    }
    return null;
  }

  static String? validateEmail(String? value, {bool isRequired = true}) {
    if (isRequired) {
      if (value == null || value.isEmpty) {
        return 'Please enter an email';
      }
    } else if (value == null || value.isEmpty) {
      return null;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, {bool isRequired = true}) {
    if (isRequired) {
      if (value == null || value.isEmpty) {
        return 'Please enter Phone number';
      }
    } else if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter valid Phone number';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (!regex.hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number and special character';
    }
    return null;
  }

  static String? validateName(String? value, {String fieldName = 'name'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }
}
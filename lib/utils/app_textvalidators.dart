class Validators {
  String? validateEmpty(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validatePasswordMatch(String password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password cannot be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateVehicleNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vehicle Number cannot be empty';
    }

    // Regular expression pattern for vehicle number format "XX 00 0000"
    RegExp regExp = RegExp(r'^[A-Z]{2}\s\d{2}\s\d{4}$');

    if (!regExp.hasMatch(value)) {
      return 'Enter a valid vehicle number';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }

    // Regular expression pattern for phone number format
    RegExp regExp = RegExp(r'^[0-9]{10}$');

    if (!regExp.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }

    return null;
  }
}

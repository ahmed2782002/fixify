class AuthValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    final phoneRegex = RegExp(r'^[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid phone number";
    }

    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return "OTP is required";
    }

    if (value.length != 5) {
      return "OTP must be 5 digits";
    }

    return null;
  }
}

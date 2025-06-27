class PasswordValidator {
  static bool hasMinLength(String password) =>
      password.length >= 8 && password.length <= 20;

  static bool hasNumber(String password) =>
      RegExp(r'\d').hasMatch(password);

  static bool hasUpper(String password) =>
      RegExp(r'[A-Z]').hasMatch(password);

  static bool hasLower(String password) =>
      RegExp(r'[a-z]').hasMatch(password);

  static bool hasSpecial(String password) =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

  static int countValidations(String password) {
    return [
      hasMinLength(password),
      hasNumber(password),
      hasUpper(password),
      hasLower(password),
      hasSpecial(password),
    ].where((v) => v).length;
  }

  static bool isValid(String password) =>
      hasMinLength(password) &&
      hasNumber(password) &&
      hasUpper(password) &&
      hasLower(password) &&
      hasSpecial(password);
}

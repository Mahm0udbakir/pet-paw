class ValidationStatus {
  final bool hasMinLength;
  final bool hasNumber;
  final bool hasUpper;
  final bool hasLower;
  final bool hasSpecial;

  const ValidationStatus({
    required this.hasMinLength,
    required this.hasNumber,
    required this.hasUpper,
    required this.hasLower,
    required this.hasSpecial,
  });
}

class ApiConfig {
  static const String baseUrl = 'http://petcare.runasp.net';

  // Endpoints
  static const String login = '/api/Account/Login';
  static const String signup = '/api/Account/signup';

  // reset password
  static const String forgetPassword = '/api/Account/ForgetPassword';
  static const String verifyOTP = '/api/Account/VerifyOTP';
  static const String resetPassword = '/api/Account/ResetPassword';
}

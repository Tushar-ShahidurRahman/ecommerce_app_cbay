class Urls{
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String userLoginUrl(String email) => '$baseUrl/UserLogin/$email';
  static String verifyOTPUrl(String email, String otp) => '$baseUrl/VerifyLogin/$email/$otp';
}
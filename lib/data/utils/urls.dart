class Urls{
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String userLoginUrl(String email) => '$baseUrl/UserLogin/$email';
}
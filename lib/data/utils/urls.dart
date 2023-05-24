class Urls {
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String userLoginUrl(String email) => '$baseUrl/UserLogin/$email';
  static String userReadProfileUrl = '$baseUrl/ReadProfile';
  static String userCreateProfileUrl = '$baseUrl/CreateProfile';
  static String productListSliderUrl = '$baseUrl/ListProductSlider';
  static String categoryListUrl = '$baseUrl/CategoryList';
  static String verifyOTPUrl(String email, String otp) =>
      '$baseUrl/VerifyLogin/$email/$otp';
}

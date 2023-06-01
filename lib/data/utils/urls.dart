class Urls {
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String userLoginUrl(String email) => '$baseUrl/UserLogin/$email';
  static String userReadProfileUrl = '$baseUrl/ReadProfile';
  static String userCreateProfileUrl = '$baseUrl/CreateProfile';
  static String productListSliderUrl = '$baseUrl/ListProductSlider';
  static String categoryListUrl = '$baseUrl/CategoryList';
  static String popularProductByRemarksUrl =
      '$baseUrl/ListProductByRemark/popular';
  static String specialProductByRemarksUrl =
      '$baseUrl/ListProductByRemark/special';
  static String newProductByRemarksUrl = '$baseUrl/ListProductByRemark/new';

  static String productByCategoryUrl(int categoryId) =>
      '$baseUrl/ListProductByCategory/$categoryId';

  static String productDetailsByProductIdUrl(int productId) =>
      '$baseUrl/ProductDetailsById/$productId';

  static String verifyOTPUrl(String email, String otp) =>
      '$baseUrl/VerifyLogin/$email/$otp';
}

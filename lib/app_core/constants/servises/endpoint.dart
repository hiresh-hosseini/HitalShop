class Endpoint {
  static String baseUrl = 'https://shop.hitaldev.ir/api/';
  static String register = 'register';
  static String login = 'login';
  static String dashboard = 'dashboard';
  static String categories = 'categories';
  static String products = 'products';
  static String review = 'review';
  static String profile = 'profile';
  static String provinces = 'provinces';
  static String address = 'address';
  static String bookmarks = 'bookmarks';
  static String addToCart = 'add-to-cart';
  static String cart = 'cart';
  static String order = 'order';
  static String productReview(int id) {
    return 'product/$id/reviews';
  }

  static String bookmars(int id) {
    return 'product/$id/bookmark';
  }
}


class RoutesConstants {
  
  // common
  static const String baseUrl = "http://192.168.189.243:8000";

  // Auth
  static const String authUser = '/api/v1/auth/users/';
  static const String authToken = '/api/v1/auth/token/login/';
  static const String userInfo = '/api/v1/info/';
  static const String isAutenticated = '/api/v1/user_is_authenticate';
  static const String logout = '/api/v1/auth/token/logout/';

  // Products:
  static const String recommendedProduct = '';
  static const String productDetail = '/api/v1/products';
  // Payments:

  // TODO: Implementar estas url en el backend:
  // Address:
  static const String addUserAddress = '/api/v1/address';
  static const String addressList = '';
  static const String userAddress = '/api/v1/user_address';
  // Orders:


}
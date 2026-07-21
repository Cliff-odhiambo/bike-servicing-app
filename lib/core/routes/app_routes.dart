class AppRoutes {
  AppRoutes._();

  // Authentication
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Rider
  static const String riderHome = '/rider-home';
  static const String search = '/search';
  static const String mechanicDetails = '/mechanic-details';
  static const String requestService = '/request-service';
  static const String requestStatus = '/request-status';
  static const String requestHistory = '/request-history';
  static const String notifications = '/notifications';
  static const String profile = '/profile';

  // Provider
  static const String providerRegistration = '/provider-registration';
  static const String providerDashboard = '/provider-dashboard';
  static const String incomingRequests = '/incoming-requests';
  static const String manageShop = '/manage-shop';

  // Admin
  static const String adminDashboard = '/admin-dashboard';
  static const String manageUsers = '/manage-users';
  static const String providerApproval = '/provider-approval';
  static const String allRequests = '/all-requests';
  static const String reports = '/reports';
}
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

import 'core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';

import 'features/authentication/login_screen.dart';
import 'features/authentication/register_screen.dart';
import 'features/rider/home/home_screen.dart';

import 'features/rider/search/search_screen.dart';
import 'features/rider/notifications/notifications_screen.dart';
import 'features/rider/profile/profile_screen.dart';
import 'features/rider/mechanic/mechanic_details_screen.dart';
import 'features/rider/request/request_service_screen.dart';
import 'features/rider/request/request_status_screen.dart';
import 'features/rider/request/request_history_screen.dart';
import 'features/provider/dashboard/dashboard_screen.dart';
import 'features/provider/registration/provider_registration_screen.dart';
import 'features/provider/requests/incoming_requests_screen.dart';
import 'features/provider/shop/manage_shop_screen.dart';

import 'features/admin/dashboard/dashboard_screen.dart';
import 'features/admin/users/manage_users_screen.dart';
import 'features/admin/providers/provider_approval_screen.dart';
import 'features/admin/requests/all_requests_screen.dart';
import 'features/admin/reports/reports_screen.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'CycleFix',
  theme: AppTheme.lightTheme,

  home: FirebaseAuth.instance.currentUser == null
    ? const LoginScreen()
    : const RiderHomePage(),

  routes: {
    AppRoutes.login: (_) => const LoginScreen(),
    AppRoutes.register: (_) => const RegisterScreen(),
    AppRoutes.riderHome: (_) => const RiderHomePage(),

    AppRoutes.search: (_) => const SearchScreen(),
    AppRoutes.notifications: (_) => const NotificationsScreen(),
    AppRoutes.profile: (_) => const ProfileScreen(),
    AppRoutes.mechanicDetails: (_) => const MechanicDetailsScreen(),
    AppRoutes.requestService: (_) =>  const RequestServiceScreen(),
    AppRoutes.requestStatus: (_) => const RequestStatusScreen(),
    AppRoutes.requestHistory: (_) => const RequestHistoryScreen(),
    AppRoutes.providerRegistration: (_) => const ProviderRegistrationScreen(),
    AppRoutes.providerDashboard: (_) => const ProviderDashboardScreen(),
    AppRoutes.incomingRequests: (_) => const IncomingRequestsScreen(),
    AppRoutes.manageShop: (_) => const ManageShopScreen(),

    AppRoutes.adminDashboard: (_) => const AdminDashboardScreen(),
    AppRoutes.manageUsers: (_) => const ManageUsersScreen(),
    AppRoutes.providerApproval: (_) => const ProviderApprovalScreen(),
    AppRoutes.allRequests: (_) => const AllRequestsScreen(),
    AppRoutes.reports: (_) => const ReportsScreen(),
  },
);
  }
}
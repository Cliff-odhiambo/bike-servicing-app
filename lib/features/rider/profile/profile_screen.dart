import 'package:flutter/material.dart';

import '../../../services/firestore_service.dart';
import '../../authentication/user_model.dart';

import '../../../shared/widgets/profile_tile.dart';
import '../../../shared/widgets/rider_scaffold.dart';

import '../../../core/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RiderScaffold(
      currentIndex: 3,
      title: "Profile",

      body: FutureBuilder<UserModel?>(
        future: FirestoreService.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Failed to load profile"),
            );
          }

          final user = snapshot.data;

          if (user == null) {
            return const Center(
              child: Text("User not found"),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xFF2F80ED),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              Center(
                child: Text(
                  user.email,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ProfileTile(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () {},
              ),

              ProfileTile(
                icon: Icons.history,
                title: "Request History",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.requestHistory,
                  );
                },
              ),

              ProfileTile(
                icon: Icons.storefront_outlined,
                title: "Become a Provider",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.providerRegistration,
                  );
                },
            ),

              ProfileTile(
                icon: Icons.notifications_outlined,
                title: "Notifications",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.notifications,
                  );
                },
              ),

              ProfileTile(
                icon: Icons.settings,
                title: "Settings",
                onTap: () {},
              ),

              ProfileTile(
                icon: Icons.help_outline,
                title: "Help & Support",
                onTap: () {},
              ),

              ProfileTile(
  icon: Icons.logout,
  title: "Logout",
  onTap: () async {
    debugPrint("1. Logout tapped");

    try {
      await FirestoreService.logout();
      debugPrint("2. Firebase signed out");

      if (!context.mounted) return;

      debugPrint("3. Navigating to login");

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    } catch (e) {
      debugPrint("Logout error: $e");
    }
  },
),
            ],
          );
        },
      ),
    );
  }
}
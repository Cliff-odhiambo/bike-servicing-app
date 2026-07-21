import 'package:flutter/material.dart';

import '../../../shared/widgets/rider_scaffold.dart';
import '../../../shared/widgets/profile_tile.dart';

import '../../../core/routes/app_routes.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RiderScaffold(
      currentIndex: 3,
      title: "Profile",

      body: ListView(
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
              "Alex Rider",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 6),

          Center(
            child: Text(
              "alex@email.com",
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
            onTap: () {},
          ),

        ],
      ),
    );
  }
}
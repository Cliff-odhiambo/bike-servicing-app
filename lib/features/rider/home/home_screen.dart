import 'package:flutter/material.dart';

import '../../../services/firestore_service.dart';
import '../../../shared/widgets/rider_scaffold.dart';

import '../../authentication/user_model.dart';

import 'widgets/greeting_section.dart';
import 'widgets/search_section.dart';
import 'widgets/quick_services_section.dart';
import 'widgets/nearby_mechanics_section.dart';

class RiderHomePage extends StatelessWidget {
  const RiderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RiderScaffold(
      currentIndex: 0,
      title: "CycleFix",

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
              child: Text(
                "Failed to load user data",
              ),
            );
          }

          final user = snapshot.data;

          if (user == null) {
            return const Center(
              child: Text(
                "No user found",
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingSection(
                  userName: user.fullName,
                ),

                const SizedBox(height: 24),

                const SearchSection(),

                const SizedBox(height: 32),

                const QuickServicesSection(),

                const SizedBox(height: 32),

                const NearbyMechanicsSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}
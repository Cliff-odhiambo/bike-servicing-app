import 'package:flutter/material.dart';

import 'widgets/provider_greeting_section.dart';
import 'widgets/dashboard_statistics.dart';
import 'widgets/recent_requests_section.dart';
import 'widgets/quick_actions_section.dart';

class ProviderDashboardScreen extends StatelessWidget {
  const ProviderDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Dashboard"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            ProviderGreetingSection(),

            SizedBox(height: 32),

            DashboardStatistics(),

            SizedBox(height: 32),

            RecentRequestsSection(),

            SizedBox(height: 32),

            QuickActionsSection(),

          ],
        ),
      ),
    );
  }
}
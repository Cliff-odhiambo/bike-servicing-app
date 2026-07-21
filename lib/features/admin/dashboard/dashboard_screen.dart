import 'package:flutter/material.dart';

import 'widgets/admin_greeting_section.dart';
import 'widgets/dashboard_statistics.dart';
import 'widgets/quick_actions_section.dart';
import 'widgets/recent_activity_section.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [

              AdminGreetingSection(),

              SizedBox(height: 30),

              DashboardStatistics(),

              SizedBox(height: 30),

              QuickActionsSection(),

              SizedBox(height: 30),

              RecentActivitySection(),

            ],
          ),
        ),
      ),
    );
  }
}
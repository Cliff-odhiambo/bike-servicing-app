import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.25,
          children: [

            _ActionCard(
              title: "Manage Users",
              icon: Icons.people,
              color: Colors.blue,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.manageUsers,
                );
              },
            ),

            _ActionCard(
              title: "Approve Providers",
              icon: Icons.verified_user,
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.providerApproval,
                );
              },
            ),

            _ActionCard(
              title: "All Requests",
              icon: Icons.assignment,
              color: Colors.orange,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.allRequests,
                );
              },
            ),

            _ActionCard(
              title: "Reports",
              icon: Icons.bar_chart,
              color: Colors.purple,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.reports,
                );
              },
            ),

          ],
        ),

      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 24,
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(
                icon,
                color: color,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
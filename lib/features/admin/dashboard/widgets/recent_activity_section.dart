import 'package:flutter/material.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Recent Activity",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        const _ActivityTile(
          icon: Icons.person_add,
          color: Colors.blue,
          title: "New rider registered",
          subtitle: "5 minutes ago",
        ),

        const _ActivityTile(
          icon: Icons.build,
          color: Colors.green,
          title: "Provider approved",
          subtitle: "18 minutes ago",
        ),

        const _ActivityTile(
          icon: Icons.assignment_turned_in,
          color: Colors.orange,
          title: "Service request completed",
          subtitle: "1 hour ago",
        ),

        const _ActivityTile(
          icon: Icons.warning_amber,
          color: Colors.red,
          title: "Provider reported",
          subtitle: "3 hours ago",
        ),
      ],
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const _ActivityTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
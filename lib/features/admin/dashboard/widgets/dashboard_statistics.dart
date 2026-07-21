import 'package:flutter/material.dart';

class DashboardStatistics extends StatelessWidget {
  const DashboardStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [

        Text(
          "System Overview",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 20),

        Row(
          children: [

            Expanded(
              child: _StatisticCard(
                title: "Riders",
                value: "248",
                icon: Icons.pedal_bike,
                color: Colors.blue,
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: _StatisticCard(
                title: "Providers",
                value: "37",
                icon: Icons.build,
                color: Colors.green,
              ),
            ),

          ],
        ),

        SizedBox(height: 16),

        Row(
          children: [

            Expanded(
              child: _StatisticCard(
                title: "Requests",
                value: "126",
                icon: Icons.assignment,
                color: Colors.orange,
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: _StatisticCard(
                title: "Pending",
                value: "12",
                icon: Icons.pending_actions,
                color: Colors.red,
              ),
            ),

          ],
        ),

      ],
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}
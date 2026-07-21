import 'package:flutter/material.dart';

import '../../../shared/widgets/rider_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RiderScaffold(
      currentIndex: 2,
      title: "Notifications",

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [

          NotificationCard(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            title: "Service Completed",
            subtitle: "CycleCare Garage has completed your repair.",
            time: "10 min ago",
          ),

          SizedBox(height: 16),

          NotificationCard(
            icon: Icons.directions_bike,
            iconColor: Colors.blue,
            title: "Mechanic On The Way",
            subtitle: "Your mechanic is heading to your location.",
            time: "35 min ago",
          ),

          SizedBox(height: 16),

          NotificationCard(
            icon: Icons.build,
            iconColor: Colors.orange,
            title: "Request Accepted",
            subtitle: "Bike Masters accepted your booking.",
            time: "Yesterday",
          ),

        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withValues(alpha: 0.15),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          time,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
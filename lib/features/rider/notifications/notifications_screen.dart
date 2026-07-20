import 'package:flutter/material.dart';

import '../../../shared/widgets/rider_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiderScaffold(
      currentIndex: 2,
      title: "Notifications",

      body: Center(
        child: Text(
          "Notifications Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
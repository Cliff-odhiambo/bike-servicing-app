import 'package:flutter/material.dart';

import '../../../shared/widgets/rider_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiderScaffold(
      currentIndex: 3,
      title: "Profile",

      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
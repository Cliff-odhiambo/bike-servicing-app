import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.riderHome,
        );
        break;

      case 1:
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.search,
        );
        break;

      case 2:
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.notifications,
        );
        break;

      case 3:
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.profile,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF2F80ED),
      unselectedItemColor: Colors.grey,
      onTap: (index) => _onItemTapped(context, index),
      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notifications",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),

      ],
    );
  }
}
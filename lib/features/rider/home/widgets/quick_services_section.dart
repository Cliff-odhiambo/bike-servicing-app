import 'package:flutter/material.dart';

import '../../../../shared/widgets/service_card.dart';

class QuickServicesSection extends StatelessWidget {
  const QuickServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Quick Services",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            ServiceCard(
              icon: Icons.build,
              title: "Repair",
              onTap: () {},
            ),

            ServiceCard(
              icon: Icons.pedal_bike,
              title: "Maintenance",
              onTap: () {},
            ),
          ],
        ),

        Row(
          children: [
            ServiceCard(
              icon: Icons.warning_amber_rounded,
              title: "Emergency",
              onTap: () {},
            ),

            ServiceCard(
              icon: Icons.shopping_bag,
              title: "Accessories",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
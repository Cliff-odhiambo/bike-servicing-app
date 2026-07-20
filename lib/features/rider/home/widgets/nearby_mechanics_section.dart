import 'package:flutter/material.dart';

import '../../../../shared/widgets/mechanic_card.dart';

class NearbyMechanicsSection extends StatelessWidget {
  const NearbyMechanicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Text(
              "Nearby Mechanics",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextButton(
              onPressed: () {
                // We'll navigate to the full mechanics list later.
              },
              child: const Text("View All"),
            ),

          ],
        ),

        const SizedBox(height: 16),

        MechanicCard(
          shopName: "CycleCare Garage",
          location: "Westlands",
          rating: 4.8,
          distance: "1.2 km",
          onTap: () {
ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Mechanic details coming soon"),
    ),
  );

          },
        ),

        MechanicCard(
          shopName: "Bike Masters",
          location: "Ruaka",
          rating: 4.7,
          distance: "2.4 km",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Mechanic details coming soon"),
    ),
  );
          },
        ),

        MechanicCard(
          shopName: "Pedal Point",
          location: "Kilimani",
          rating: 4.9,
          distance: "3.1 km",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Mechanic details coming soon"),
    ),
  );
          },
        ),
      ],
    );
  }
}
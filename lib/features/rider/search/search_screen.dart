import 'package:flutter/material.dart';

import '../../../shared/widgets/rider_scaffold.dart';
import '../../../shared/widgets/mechanic_card.dart';
import '../../../core/routes/app_routes.dart';

import '../home/widgets/search_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RiderScaffold(
      currentIndex: 1,
      title: "Search Mechanics",

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SearchSection(),

            const SizedBox(height: 24),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [

                Chip(label: Text("Repair")),

                Chip(label: Text("Wash")),

                Chip(label: Text("Parts")),

                Chip(label: Text("Emergency")),

              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Nearby Mechanics",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            MechanicCard(
              shopName: "CycleCare Garage",
              location: "Westlands",
              rating: 4.8,
              distance: "1.2 km",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.mechanicDetails,
                );
            },
            ),

            MechanicCard(
              shopName: "Bike Masters",
              location: "Ruaka",
              rating: 4.7,
              distance: "2.4 km",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.mechanicDetails,
                );
            },
            ),

            MechanicCard(
              shopName: "Pedal Point",
              location: "Kilimani",
              rating: 4.9,
              distance: "3.1 km",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.mechanicDetails,
                );
            },
            ),

          ],
        ),
      ),
    );
  }
}
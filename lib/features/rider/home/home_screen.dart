import 'package:flutter/material.dart';

import '../../../shared/widgets/rider_scaffold.dart';

import 'widgets/greeting_section.dart';
import 'widgets/search_section.dart';
import 'widgets/quick_services_section.dart';
import 'widgets/nearby_mechanics_section.dart';

import '../models/sample_rider.dart';

class RiderHomePage extends StatelessWidget {
  const RiderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RiderScaffold(
      currentIndex: 0,
      title: "CycleFix",

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingSection(
              userName: sampleRider.name,
            ),

            const SizedBox(height: 24),

            const SearchSection(),

            const SizedBox(height: 32),

            const QuickServicesSection(),

            const SizedBox(height: 32),

            const NearbyMechanicsSection(),
          ],
        ),
      ),
    );
  }
}
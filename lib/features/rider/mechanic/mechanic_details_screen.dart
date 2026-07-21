import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';

class MechanicDetailsScreen extends StatelessWidget {
  const MechanicDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mechanic Details"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.pedal_bike,
                size: 90,
                color: Color(0xFF2F80ED),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "CycleCare Garage",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 6),
                Text("4.8 (215 Reviews)"),
              ],
            ),

            const SizedBox(height: 12),

            const Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 6),
                Text("Westlands, Nairobi"),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              children: [

                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.message),
                    label: const Text("Message"),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "About",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "CycleCare Garage specializes in bicycle servicing, repairs, tune-ups, brake adjustments and wheel alignment. We provide fast and reliable service for all bike types.",
            ),

            const SizedBox(height: 30),

            const Text(
              "Services Offered",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Tune-up"),
            ),

            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Brake Repair"),
            ),

            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Wheel Alignment"),
            ),

            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Tire Replacement"),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.requestService,
                  );
                },
                child: const Text(
                  "Book Service",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
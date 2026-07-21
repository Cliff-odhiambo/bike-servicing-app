import 'package:flutter/material.dart';

class RecentRequestsSection extends StatelessWidget {
  const RecentRequestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Recent Requests",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        Card(
          child: ListTile(
            leading: const Icon(Icons.pedal_bike),
            title: const Text("Brake Repair"),
            subtitle: const Text("John • Westlands"),
            trailing: FilledButton(
              onPressed: () {},
              child: const Text("View"),
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.build),
            title: const Text("Tune-up"),
            subtitle: const Text("Brian • Ruaka"),
            trailing: FilledButton(
              onPressed: () {},
              child: const Text("View"),
            ),
          ),
        ),

      ],
    );
  }
}
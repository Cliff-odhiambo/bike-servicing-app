import 'package:flutter/material.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.store),
          label: const Text("Manage Shop"),
        ),

        const SizedBox(height: 12),

        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.assignment),
          label: const Text("Incoming Requests"),
        ),

      ],
    );
  }
}
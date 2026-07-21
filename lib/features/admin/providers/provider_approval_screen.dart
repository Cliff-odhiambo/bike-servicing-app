import 'package:flutter/material.dart';

class ProviderApprovalScreen extends StatelessWidget {
  const ProviderApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Approval"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [

          _ApprovalCard(
            shopName: "CycleCare Garage",
            owner: "John Kamau",
          ),

          _ApprovalCard(
            shopName: "Bike Masters",
            owner: "Jane Njeri",
          ),

        ],
      ),
    );
  }
}

class _ApprovalCard extends StatelessWidget {
  final String shopName;
  final String owner;

  const _ApprovalCard({
    required this.shopName,
    required this.owner,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              shopName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(owner),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text("Approve"),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Reject"),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
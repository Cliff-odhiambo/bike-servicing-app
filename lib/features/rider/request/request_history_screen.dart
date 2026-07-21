import 'package:flutter/material.dart';

class RequestHistoryScreen extends StatelessWidget {
  const RequestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request History"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [

          RequestHistoryCard(
            mechanic: "CycleCare Garage",
            service: "Brake Repair",
            date: "21 Jul 2026",
            status: "Completed",
            statusColor: Colors.green,
          ),

          SizedBox(height: 16),

          RequestHistoryCard(
            mechanic: "Bike Masters",
            service: "Tune-up",
            date: "19 Jul 2026",
            status: "Cancelled",
            statusColor: Colors.red,
          ),

          SizedBox(height: 16),

          RequestHistoryCard(
            mechanic: "Pedal Point",
            service: "Wheel Alignment",
            date: "18 Jul 2026",
            status: "Pending",
            statusColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class RequestHistoryCard extends StatelessWidget {
  final String mechanic;
  final String service;
  final String date;
  final String status;
  final Color statusColor;

  const RequestHistoryCard({
    super.key,
    required this.mechanic,
    required this.service,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              mechanic,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(service),

            const SizedBox(height: 8),

            Text(date),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
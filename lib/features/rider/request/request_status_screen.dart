import 'package:flutter/material.dart';

class RequestStatusScreen extends StatelessWidget {
  const RequestStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Status"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Icon(
                Icons.pedal_bike,
                size: 90,
                color: Color(0xFF2F80ED),
              ),
            ),

            const SizedBox(height: 24),

            const Center(
              child: Text(
                "CycleCare Garage",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            _buildStatusTile(
              title: "Request Submitted",
              subtitle: "Your request has been received.",
              completed: true,
            ),

            _buildStatusTile(
              title: "Mechanic Accepted",
              subtitle: "Waiting for the mechanic to accept.",
              completed: false,
            ),

            _buildStatusTile(
              title: "Mechanic On The Way",
              subtitle: "The mechanic is travelling to you.",
              completed: false,
            ),

            _buildStatusTile(
              title: "Service Completed",
              subtitle: "Your bike has been serviced.",
              completed: false,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {},
                child: const Text(
                  "Refresh Status",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildStatusTile({
    required String title,
    required String subtitle,
    required bool completed,
  }) {
    return ListTile(
      leading: Icon(
        completed
            ? Icons.check_circle
            : Icons.radio_button_unchecked,
        color: completed ? Colors.green : Colors.grey,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
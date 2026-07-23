import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../requests/request_controller.dart';
import '../../requests/request_model.dart';

class RequestStatusScreen extends StatelessWidget {
  final String requestId;

  RequestStatusScreen({
    super.key,
    required this.requestId,
  });

  final RequestController requestController =
      RequestController();

  Color _statusColor(String status) {
    switch (status) {
      case "accepted":
        return Colors.blue;
      case "completed":
        return Colors.green;
      case "rejected":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case "accepted":
        return Icons.handshake;
      case "completed":
        return Icons.check_circle;
      case "rejected":
        return Icons.cancel;
      default:
        return Icons.hourglass_top;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rider = FirebaseAuth.instance.currentUser;

    if (rider == null) {
      return const Scaffold(
        body: Center(
          child: Text("Please log in."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Status"),
      ),
      body: FutureBuilder<RequestModel?>(
       future: requestController.getRequestById(
        requestId,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final request = snapshot.data;

          if (request == null) {
            return const Center(
              child: Text(
                "You have no service requests.",
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              // Rebuilds the FutureBuilder
            },
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Center(
                  child: Icon(
                    _statusIcon(request.status),
                    size: 90,
                    color: _statusColor(request.status),
                  ),
                ),

                const SizedBox(height: 24),

                Center(
                  child: Text(
                    request.serviceType,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Center(
                  child: Text(
                    request.status.toUpperCase(),
                    style: TextStyle(
                      color: _statusColor(request.status),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.pedal_bike),
                    title: const Text("Bike Type"),
                    subtitle: Text(request.bikeType),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Pickup Location"),
                    subtitle: Text(request.pickupLocation),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.build),
                    title: const Text("Issue"),
                    subtitle: Text(request.issueDescription),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.payments),
                    title: const Text("Estimated Price"),
                    subtitle: Text(
                      "KSh ${request.estimatedPrice.toStringAsFixed(0)}",
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text("Preferred Date"),
                    subtitle: Text(
                      request.preferredDateTime.toString(),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                FilledButton.icon(
                  onPressed: () {
                    (context as Element).markNeedsBuild();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text("Refresh Status"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
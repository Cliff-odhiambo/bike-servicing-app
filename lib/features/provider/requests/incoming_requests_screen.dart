import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../requests/request_controller.dart';
import '../../requests/request_model.dart';

class IncomingRequestsScreen extends StatelessWidget {
  IncomingRequestsScreen({super.key});

  final RequestController requestController =
      RequestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incoming Requests"),
      ),
      body: FutureBuilder<List<RequestModel>>(
        future: requestController.getPendingRequests(),
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

          final requests = snapshot.data ?? [];

          if (requests.isEmpty) {
            return const Center(
              child: Text(
                "No pending requests.",
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.serviceType,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Bike: ${request.bikeType}",
                      ),

                      Text(
                        "Location: ${request.pickupLocation}",
                      ),

                      Text(
                        "Estimated Price: KSh ${request.estimatedPrice.toStringAsFixed(0)}",
                      ),

                      const SizedBox(height: 10),

                      Text(
                        request.issueDescription,
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () async {
                                final provider =
                                    FirebaseAuth.instance.currentUser;

                                if (provider == null) return;

                                await requestController.acceptRequest(
                                  request.id,
                                  provider.uid,
                                );

                                if (!context.mounted) return;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Request accepted successfully.",
                                    ),
                                  ),
                                );

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => IncomingRequestsScreen(),
                                  ),
                                );
                              },
                              child: const Text("Accept"),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: OutlinedButton(
                              onPressed: () async {
                                await requestController.rejectRequest(
                                  request.id,
                                );

                                if (!context.mounted) return;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Request rejected successfully.",
                                    ),
                                  ),
                                );

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => IncomingRequestsScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Reject",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
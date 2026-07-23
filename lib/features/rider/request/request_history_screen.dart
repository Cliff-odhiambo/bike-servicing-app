import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../requests/request_controller.dart';
import '../../requests/request_model.dart';
import 'request_status_screen.dart';

class RequestHistoryScreen extends StatelessWidget {
  RequestHistoryScreen({super.key});

  final RequestController requestController =
      RequestController();

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "completed":
        return Colors.green;
      case "accepted":
        return Colors.blue;
      case "rejected":
        return Colors.red;
      default:
        return Colors.orange;
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
        title: const Text("Request History"),
      ),
      body: FutureBuilder<List<RequestModel>>(
        future: requestController.getRiderRequests(
          rider.uid,
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

          final requests = snapshot.data ?? [];

          if (requests.isEmpty) {
            return const Center(
              child: Text(
                "No requests found.",
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: requests.length,
            separatorBuilder: (context, index) =>
              const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final request = requests[index];

              return RequestHistoryCard(
                request: request,
                statusColor:
                    _statusColor(request.status),
              );
            },
          );
        },
      ),
    );
  }
}

class RequestHistoryCard extends StatelessWidget {
  final RequestModel request;
  final Color statusColor;

  const RequestHistoryCard({
    super.key,
    required this.request,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius:
            BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RequestStatusScreen(
                requestId: request.id,
              ),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                request.serviceType,
                style: const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                request.bikeType,
              ),

              const SizedBox(height: 8),

              Text(
                request.pickupLocation,
              ),

              const SizedBox(height: 8),

              Text(
                "${request.createdAt.day}/${request.createdAt.month}/${request.createdAt.year}",
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration:
                        BoxDecoration(
                      color: statusColor
                          .withAlpha(40),
                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Text(
                      request.status
                          .toUpperCase(),
                      style: TextStyle(
                        color:
                            statusColor,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "KSh ${request.estimatedPrice.toStringAsFixed(0)}",
                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
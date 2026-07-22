import 'package:flutter/material.dart';

import '../../../services/firestore_service.dart';
import '../../provider/provider_model.dart';

class ProviderApprovalScreen extends StatefulWidget {
  const ProviderApprovalScreen({super.key});

  @override
  State<ProviderApprovalScreen> createState() =>
      _ProviderApprovalScreenState();
}

class _ProviderApprovalScreenState
    extends State<ProviderApprovalScreen> {
  late Future<List<ProviderModel>> pendingProviders;

  @override
  void initState() {
    super.initState();
    loadProviders();
  }

  void loadProviders() {
    pendingProviders = FirestoreService.getPendingProviders();
  }

  Future<void> approve(String id) async {
    await FirestoreService.approveProvider(id);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Provider approved."),
      ),
    );

    setState(() {
      loadProviders();
    });
  }

  Future<void> reject(String id) async {
    await FirestoreService.rejectProvider(id);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Provider rejected."),
      ),
    );

    setState(() {
      loadProviders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Approval"),
      ),
      body: FutureBuilder<List<ProviderModel>>(
        future: pendingProviders,
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

          final providers = snapshot.data ?? [];

          if (providers.isEmpty) {
            return const Center(
              child: Text(
                "No pending providers",
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: providers.length,
            itemBuilder: (context, index) {
              final provider = providers[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.shopName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Location: ${provider.location}",
                      ),

                      Text(
                        "Phone: ${provider.businessPhone}",
                      ),

                      Text(
                        "Experience: ${provider.experience}",
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () =>
                                  approve(provider.id),
                              child: const Text(
                                "Approve",
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: OutlinedButton(
                              onPressed: () =>
                                  reject(provider.id),
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
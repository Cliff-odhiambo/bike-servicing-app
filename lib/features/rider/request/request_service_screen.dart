import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() =>
      _RequestServiceScreenState();
}

class _RequestServiceScreenState
    extends State<RequestServiceScreen> {

  final TextEditingController issueController =
      TextEditingController();

  String selectedService = "Tune-up";

  final List<String> services = [
    "Tune-up",
    "Brake Repair",
    "Wheel Alignment",
    "Tire Replacement",
    "Bike Wash",
  ];

  @override
  void dispose() {
    issueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Service"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            const Text(
              "Select Service",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              initialValue: selectedService,
              items: services
                  .map(
                    (service) =>
                        DropdownMenuItem(
                      value: service,
                      child: Text(service),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedService = value!;
                });
              },
            ),

            const SizedBox(height: 24),

            const Text(
              "Preferred Date",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                hintText: "22 July 2026",
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Preferred Time",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                hintText: "10:00 AM",
                prefixIcon: Icon(Icons.access_time),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Describe the Issue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: issueController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText:
                    "Describe the problem...",
              ),
            ),

            const SizedBox(height: 30),

            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "Estimated Cost",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

                Text(
                  "KSh 1,200",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 40),

            SizedBox(
  width: double.infinity,
  height: 55,
  child: FilledButton(
    onPressed: () {
      Navigator.pushNamed(
        context,
        AppRoutes.requestStatus,
      );
    },
    child: const Text(
      "Request Service",
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../requests/request_controller.dart';
import '../../requests/request_model.dart';

import '../../../core/routes/app_routes.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() =>
      _RequestServiceScreenState();
}

class _RequestServiceScreenState
    extends State<RequestServiceScreen> {

  final formKey = GlobalKey<FormState>();

final issueController = TextEditingController();
final locationController = TextEditingController();
final RequestController requestController = RequestController();

DateTime? selectedDate;
TimeOfDay? selectedTime;

bool isLoading = false;

String selectedService = "Tune-up";
String selectedBike = "Mountain Bike";

final List<String> services = [
  "Tune-up",
  "Brake Repair",
  "Wheel Alignment",
  "Tire Replacement",
  "Bike Wash",
];

final List<String> bikeTypes = [
  "Mountain Bike",
  "Road Bike",
  "BMX",
  "Hybrid Bike",
  "Electric Bike",
];

  @override
  void dispose() {
    issueController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
  final picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      const Duration(days: 365),
    ),
  );

  if (picked != null) {
    setState(() {
      selectedDate = picked;
    });
  }
}

Future<void> pickTime() async {
  final picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {
    setState(() {
      selectedTime = picked;
    });
  }
}

Future<void> submitRequest() async {
  if (!(formKey.currentState?.validate() ?? false)) {
    return;
  }

  if (selectedDate == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please select a preferred date."),
      ),
    );
    return;
  }

  if (selectedTime == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please select a preferred time."),
      ),
    );
    return;
  }

  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please log in again."),
      ),
    );
    return;
  }

  setState(() {
    isLoading = true;
  });

  final preferredDateTime = DateTime(
    selectedDate!.year,
    selectedDate!.month,
    selectedDate!.day,
    selectedTime!.hour,
    selectedTime!.minute,
  );

  final request = RequestModel(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    riderId: user.uid,
    providerId: "",
    serviceType: selectedService,
    bikeType: selectedBike,
    issueDescription: issueController.text.trim(),
    pickupLocation: locationController.text.trim(),
    status: "pending",
    estimatedPrice: 1200,
    createdAt: DateTime.now(),
    preferredDateTime: preferredDateTime,
  );

  final error =
      await requestController.createRequest(request);

  if (!mounted) return;

  setState(() {
    isLoading = false;
  });

  if (error != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Request submitted successfully."),
    ),
  );

  Navigator.pushReplacementNamed(
    context,
    AppRoutes.requestStatus,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Service"),
      ),

      body: SingleChildScrollView(
  padding: const EdgeInsets.all(24),
  child: Form(
    key: formKey,
    child: Column(
      children: [

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
              "Bike Type",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              initialValue: selectedBike,
              items: bikeTypes
                  .map(
                    (bike) => DropdownMenuItem(
                      value: bike,
                      child: Text(bike),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedBike = value!;
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
              controller: TextEditingController(
              text: selectedDate == null
                ? ""
                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              ),
              decoration: const InputDecoration(
              hintText: "Select preferred date",
              prefixIcon: Icon(Icons.calendar_today),
            ),
              onTap: pickDate,
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
              controller: TextEditingController(
                text: selectedTime == null
                    ? ""
                    : selectedTime!.format(context),
              ),
              decoration: const InputDecoration(
                hintText: "Select preferred time",
                prefixIcon: Icon(Icons.access_time),
              ),
              onTap: pickTime,
            ),

            const SizedBox(height: 24),

            const Text(
              "Pickup Location",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: locationController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a pickup location";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Enter pickup location",
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

            TextFormField(
              controller: issueController,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please describe the issue";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Describe the problem...",
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
              onPressed: isLoading ? null : submitRequest,
            

          child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Text(
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
      ),

    );
  }
}

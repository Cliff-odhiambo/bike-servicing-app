import 'package:flutter/material.dart';

class ProviderForm extends StatefulWidget {
  const ProviderForm({super.key});

  @override
  State<ProviderForm> createState() => _ProviderFormState();
}

class _ProviderFormState extends State<ProviderForm> {
  final shopController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  String selectedExperience = "1-3 Years";

  final experiences = [
    "Less than 1 Year",
    "1-3 Years",
    "4-7 Years",
    "8+ Years",
  ];

  @override
  void dispose() {
    shopController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shop Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: shopController,
          decoration: const InputDecoration(
            hintText: "CycleCare Garage",
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Business Phone",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: "07XXXXXXXX",
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Location",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: locationController,
          decoration: const InputDecoration(
            hintText: "Westlands",
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Experience",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: selectedExperience,
          items: experiences
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedExperience = value!;
            });
          },
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: FilledButton(
            onPressed: () {},
            child: const Text("Save Profile"),
          ),
        ),
      ],
    );
  }
}
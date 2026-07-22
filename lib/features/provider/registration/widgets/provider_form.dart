import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../provider_controller.dart';

class ProviderForm extends StatefulWidget {
  const ProviderForm({super.key});

  @override
  State<ProviderForm> createState() => _ProviderFormState();
}

class _ProviderFormState extends State<ProviderForm> {
  final shopController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  final ProviderController providerController = ProviderController();

  bool isLoading = false;

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

  Future<void> saveProvider() async {
    setState(() {
      isLoading = true;
    });

    final error = await providerController.registerProvider(
      shopName: shopController.text.trim(),
      businessPhone: phoneController.text.trim(),
      location: locationController.text.trim(),
      experience: selectedExperience,
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Provider profile submitted successfully.",
        ),
      ),
    );

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.providerDashboard,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shop Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          initialValue: selectedExperience,
          items: experiences
              .map(
                (experience) => DropdownMenuItem(
                  value: experience,
                  child: Text(experience),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) return;

            setState(() {
              selectedExperience = value;
            });
          },
        ),

        const SizedBox(height: 40),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: FilledButton(
            onPressed: isLoading ? null : saveProvider,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    "Save Profile",
                  ),
          ),
        ),
      ],
    );
  }
}
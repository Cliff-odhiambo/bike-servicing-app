import 'package:flutter/material.dart';

class ManageShopScreen extends StatelessWidget {
  const ManageShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Shop"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Shop Name",
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            decoration: const InputDecoration(
              labelText: "Location",
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            decoration: const InputDecoration(
              labelText: "Business Phone",
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Description",
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Save Changes"),
            ),
          ),
        ],
      ),
    );
  }
}
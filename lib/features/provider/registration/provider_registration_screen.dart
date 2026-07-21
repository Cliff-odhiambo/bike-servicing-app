import 'package:flutter/material.dart';

import 'widgets/provider_form.dart';

class ProviderRegistrationScreen extends StatelessWidget {
  const ProviderRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Provider Registration",
        ),
      ),

      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: ProviderForm(),
        ),
      ),
    );
  }
}
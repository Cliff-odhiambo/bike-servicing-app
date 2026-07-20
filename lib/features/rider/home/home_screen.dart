import 'package:flutter/material.dart';

class RiderHomePage extends StatelessWidget {
  const RiderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bike Service",
        ),
      ),

      body: const Center(
        child: Text(
          "Welcome Rider",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  final String userName;

  const GreetingSection({
    super.key,
    required this.userName,
  });

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    }

    if (hour < 17) {
      return "Good Afternoon";
    }

    return "Good Evening";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                getGreeting(),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                userName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Need a bike service today?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

            ],
          ),
        ),

        Stack(
          children: [

            const CircleAvatar(
              radius: 26,
              backgroundColor: Color(0xFF2F80ED),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),

            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),

          ],
        ),

      ],
    );
  }
}
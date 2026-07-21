import 'package:flutter/material.dart';

class IncomingRequestsScreen extends StatelessWidget {
  const IncomingRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incoming Requests"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text("John Kamau"),
              subtitle: const Text(
                "Brake Repair • Westlands",
              ),
              trailing: FilledButton(
                onPressed: () {},
                child: const Text("Accept"),
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text("Brian Otieno"),
              subtitle: const Text(
                "Bike Wash • Ruaka",
              ),
              trailing: FilledButton(
                onPressed: () {},
                child: const Text("Accept"),
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text("Mary Wanjiku"),
              subtitle: const Text(
                "Tune-up • Kilimani",
              ),
              trailing: FilledButton(
                onPressed: () {},
                child: const Text("Accept"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
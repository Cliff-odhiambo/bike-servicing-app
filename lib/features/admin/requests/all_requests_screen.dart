import 'package:flutter/material.dart';

class AllRequestsScreen extends StatelessWidget {
  const AllRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Requests"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [

          ListTile(
            leading: Icon(Icons.pedal_bike),
            title: Text("Brake Repair"),
            subtitle: Text("Alex Rider"),
            trailing: Chip(
              label: Text("Pending"),
            ),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.pedal_bike),
            title: Text("Bike Wash"),
            subtitle: Text("Mary Wanjiku"),
            trailing: Chip(
              label: Text("Completed"),
            ),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.pedal_bike),
            title: Text("Wheel Alignment"),
            subtitle: Text("David Maina"),
            trailing: Chip(
              label: Text("Accepted"),
            ),
          ),

        ],
      ),
    );
  }
}
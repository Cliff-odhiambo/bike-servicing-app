import 'package:flutter/material.dart';

class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Users"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [

          _UserTile(
            name: "Alex Rider",
            email: "alex@email.com",
            role: "Rider",
          ),

          _UserTile(
            name: "John Mechanic",
            email: "john@cyclefix.com",
            role: "Provider",
          ),

          _UserTile(
            name: "Mary Wanjiku",
            email: "mary@email.com",
            role: "Rider",
          ),

          _UserTile(
            name: "Peter Mwangi",
            email: "peter@garage.com",
            role: "Provider",
          ),
        ],
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  final String name;
  final String email;
  final String role;

  const _UserTile({
    required this.name,
    required this.email,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: const Icon(Icons.person),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(email),

        trailing: Chip(
          label: Text(role),
        ),
      ),
    );
  }
}
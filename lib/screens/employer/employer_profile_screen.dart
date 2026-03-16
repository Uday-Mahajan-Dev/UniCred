import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main.dart';

class EmployerProfileScreen extends StatelessWidget {
  const EmployerProfileScreen({super.key});

  Widget infoTile(String label, String value) {
    return ListTile(title: Text(label), subtitle: Text(value));
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const RoleSelectionPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final email = user?.email ?? "No Email";
    final id = user?.uid ?? "No ID";

    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      appBar: AppBar(
        title: const Text("Employer Profile"),
        elevation: 0,
        backgroundColor: const Color(0xffe6e9ef),
        foregroundColor: Colors.black,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 30),

          const CircleAvatar(radius: 50, child: Icon(Icons.business, size: 40)),

          const SizedBox(height: 30),

          infoTile("Company Email", email),
          infoTile("Employer ID", id),

          const SizedBox(height: 40),

          ElevatedButton.icon(
            onPressed: () => signOut(context),
            icon: const Icon(Icons.logout),
            label: const Text("Sign Out"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}

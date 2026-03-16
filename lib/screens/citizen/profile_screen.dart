import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget infoTile(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffe6e9ef),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color(0xFFBEBEBE),
            offset: Offset(6, 6),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
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

    final name = user?.displayName ?? "Citizen";
    final email = user?.email ?? "No Email";
    final did = user?.uid ?? "No DID";

    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 0,
        backgroundColor: const Color(0xffe6e9ef),
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),

            const SizedBox(height: 30),

            infoTile("Name", name),
            infoTile("Email", email),
            infoTile("DID", did),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () => signOut(context),
              icon: const Icon(Icons.logout),
              label: const Text("Sign Out"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

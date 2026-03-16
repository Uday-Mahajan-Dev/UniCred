import 'package:flutter/material.dart';

class VerifyRequestsScreen extends StatelessWidget {
  const VerifyRequestsScreen({super.key});

  Widget requestTile(String name, String credential) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(name),
      subtitle: Text(credential),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      appBar: AppBar(
        title: const Text("Verification Requests"),
        elevation: 0,
        backgroundColor: const Color(0xffe6e9ef),
        foregroundColor: Colors.black,
      ),

      body: ListView(
        children: [
          requestTile("Rahul Sharma", "B.Tech Degree"),
          requestTile("Amit Singh", "Government ID"),
          requestTile("Neha Gupta", "M.Tech Degree"),
        ],
      ),
    );
  }
}

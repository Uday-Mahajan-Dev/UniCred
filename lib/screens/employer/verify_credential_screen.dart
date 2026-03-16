import 'package:flutter/material.dart';
import '../../services/demo_data.dart';

class VerifyCredentialScreen extends StatefulWidget {
  const VerifyCredentialScreen({super.key});

  @override
  State<VerifyCredentialScreen> createState() => _VerifyCredentialScreenState();
}

class _VerifyCredentialScreenState extends State<VerifyCredentialScreen> {
  final controller = TextEditingController();

  String result = "";

  void verify() {
    final match = DemoData.credentials
        .where((c) => c.title == controller.text)
        .toList();

    if (match.isEmpty) {
      setState(() {
        result = "Invalid Credential";
      });
    } else {
      setState(() {
        result = "Credential Verified ✔";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Credential")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter Credential Title",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: verify, child: const Text("Verify")),

            const SizedBox(height: 30),

            Text(result, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

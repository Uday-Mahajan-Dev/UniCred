import 'package:flutter/material.dart';
import '../../models/credential.dart';
import '../../services/demo_data.dart';

class IssueCredentialScreen extends StatefulWidget {
  const IssueCredentialScreen({super.key});

  @override
  State<IssueCredentialScreen> createState() => _IssueCredentialScreenState();
}

class _IssueCredentialScreenState extends State<IssueCredentialScreen> {
  final title = TextEditingController();
  final holder = TextEditingController();
  final year = TextEditingController();

  void issueCredential() {
    DemoData.addCredential(
      Credential(title: title.text, issuer: "Demo University", date: year.text),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Credential Issued Successfully")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Issue Credential")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(labelText: "Credential Title"),
            ),

            TextField(
              controller: holder,
              decoration: const InputDecoration(labelText: "Holder Email"),
            ),

            TextField(
              controller: year,
              decoration: const InputDecoration(labelText: "Year"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: issueCredential,
              child: const Text("Issue Credential"),
            ),
          ],
        ),
      ),
    );
  }
}

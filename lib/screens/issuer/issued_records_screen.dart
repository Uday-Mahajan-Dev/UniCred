import 'package:flutter/material.dart';
import '../../models/credential.dart';
import '../../services/demo_data.dart';

class IssuedRecordsScreen extends StatelessWidget {
  const IssuedRecordsScreen({super.key});

  Widget credentialTile(Credential credential) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffe6e9ef),
        borderRadius: BorderRadius.circular(18),
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
          Icon(
            credential.verified ? Icons.verified : Icons.warning,
            color: credential.verified ? Colors.green : Colors.orange,
            size: 30,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  credential.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text("Issuer: ${credential.issuer}"),

                const SizedBox(height: 2),

                Text("Issued: ${credential.date}"),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final credentials = DemoData.credentials;

    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      appBar: AppBar(
        title: const Text("Issued Credentials"),
        elevation: 0,
        backgroundColor: const Color(0xffe6e9ef),
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView.builder(
          itemCount: credentials.length,
          itemBuilder: (context, index) {
            return credentialTile(credentials[index]);
          },
        ),
      ),
    );
  }
}

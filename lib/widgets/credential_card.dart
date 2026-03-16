import 'package:flutter/material.dart';
import '../models/credential.dart';

class CredentialCard extends StatelessWidget {
  final Credential credential;

  const CredentialCard({super.key, required this.credential});

  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                credential.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text("Issuer: ${credential.issuer}"),
              Text("Issued: ${credential.date}"),
            ],
          ),
        ],
      ),
    );
  }
}

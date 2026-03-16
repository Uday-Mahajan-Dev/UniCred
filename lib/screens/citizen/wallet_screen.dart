import 'package:flutter/material.dart';
import '../../services/demo_data.dart';
import '../../widgets/credential_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final credentials = DemoData.credentials;

    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),

      appBar: AppBar(title: const Text("Credential Wallet"), centerTitle: true),

      body: credentials.isEmpty
          ? const Center(
              child: Text("No credentials yet", style: TextStyle(fontSize: 18)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: credentials.length,
              itemBuilder: (context, index) {
                return CredentialCard(credential: credentials[index]);
              },
            ),
    );
  }
}

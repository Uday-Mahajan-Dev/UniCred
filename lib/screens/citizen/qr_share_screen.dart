import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRShareScreen extends StatelessWidget {
  const QRShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Share Credential")),

      body: Center(child: QrImageView(data: "citizen_verification", size: 220)),
    );
  }
}

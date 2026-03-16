import 'package:flutter/material.dart';

class IssuerAnalyticsScreen extends StatelessWidget {
  const IssuerAnalyticsScreen({super.key});

  Widget stat(String title, String value) {
    return Container(
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
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      appBar: AppBar(
        title: const Text("Issuer Analytics"),
        elevation: 0,
        backgroundColor: const Color(0xffe6e9ef),
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Row(
          children: [
            Expanded(child: stat("Credentials Issued", "324")),
            const SizedBox(width: 15),

            Expanded(child: stat("Active Requests", "18")),
            const SizedBox(width: 15),

            Expanded(child: stat("Verified", "280")),
          ],
        ),
      ),
    );
  }
}

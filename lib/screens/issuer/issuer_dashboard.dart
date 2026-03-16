import 'package:flutter/material.dart';
import 'issue_credential_screen.dart';
import 'issued_records_screen.dart';
import 'verify_requests_screen.dart';
import 'issuer_analytics_screen.dart';
import 'issuer_profile_screen.dart';

class IssuerDashboard extends StatelessWidget {
  const IssuerDashboard({super.key});

  Widget actionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: const Color(0xffe6e9ef),
          borderRadius: BorderRadius.circular(20),
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
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, size: 40, color: color),

            const SizedBox(height: 12),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      appBar: AppBar(
        title: const Text("Issuer Dashboard"),
        elevation: 0,
        backgroundColor: const Color(0xffe6e9ef),
        foregroundColor: Colors.black,

        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const IssuerProfileScreen()),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,

          children: [
            actionCard(
              context,
              "Issue Credential",
              Icons.school,
              Colors.indigo,
              const IssueCredentialScreen(),
            ),

            actionCard(
              context,
              "Issued Records",
              Icons.history,
              Colors.blue,
              const IssuedRecordsScreen(),
            ),

            actionCard(
              context,
              "Verify Requests",
              Icons.verified,
              Colors.green,
              const VerifyRequestsScreen(),
            ),

            actionCard(
              context,
              "Analytics",
              Icons.bar_chart,
              Colors.orange,
              const IssuerAnalyticsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'verify_credential_screen.dart';
import 'employer_profile_screen.dart';

class EmployerDashboard extends StatelessWidget {
  const EmployerDashboard({super.key});

  Widget statCard(String title, String value) {
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
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }

  Widget neumorphicButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
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
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner),
              SizedBox(width: 10),
              Text(
                "Verify Credential",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget verificationTile(String title, String subtitle) {
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
      child: ListTile(
        leading: const Icon(Icons.verified, color: Colors.green),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      appBar: AppBar(
        title: const Text("Employer Dashboard"),
        elevation: 0,
        backgroundColor: const Color(0xffe6e9ef),
        foregroundColor: Colors.black,

        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EmployerProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Verification Analytics",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: statCard("Verified", "54")),
                const SizedBox(width: 15),
                Expanded(child: statCard("Pending", "4")),
                const SizedBox(width: 15),
                Expanded(child: statCard("Candidates", "32")),
              ],
            ),

            const SizedBox(height: 30),

            neumorphicButton(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const VerifyCredentialScreen(),
                ),
              );
            }),

            const SizedBox(height: 30),

            const Text(
              "Recent Verifications",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            verificationTile("B.Tech Degree", "Verified from ABC University"),

            verificationTile(
              "Government ID",
              "Verified by Government Authority",
            ),
          ],
        ),
      ),
    );
  }
}

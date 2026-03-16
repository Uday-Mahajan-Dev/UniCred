import 'package:flutter/material.dart';
import '../../widgets/feature_tile.dart';
import '../../widgets/soft_card.dart';

import 'wallet_screen.dart';
import 'profile_screen.dart';
import 'qr_share_screen.dart';
import 'ai_resume_builder_screen.dart';

class CitizenDashboard extends StatelessWidget {
  const CitizenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e9ef),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "Top Features",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                SoftCard(
                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      physics: const NeverScrollableScrollPhysics(),

                      children: [
                        /// WALLET
                        FeatureTile(
                          icon: Icons.account_balance_wallet,
                          title: "Wallet",
                          color: Colors.purple,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const WalletScreen(),
                              ),
                            );
                          },
                        ),

                        /// SHARE QR
                        FeatureTile(
                          icon: Icons.qr_code,
                          title: "Share",
                          color: Colors.orange,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const QRShareScreen(),
                              ),
                            );
                          },
                        ),

                        /// AI RESUME BUILDER
                        FeatureTile(
                          icon: Icons.description,
                          title: "Resume",
                          color: Colors.blue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AIResumeBuilderScreen(),
                              ),
                            );
                          },
                        ),

                        /// PROFILE
                        FeatureTile(
                          icon: Icons.person,
                          title: "Profile",
                          color: Colors.green,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ProfileScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Recent Activity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const ListTile(
                  leading: Icon(Icons.verified, color: Colors.green),
                  title: Text("B.Tech Degree"),
                  subtitle: Text("ABC University"),
                ),

                const ListTile(
                  leading: Icon(Icons.verified, color: Colors.green),
                  title: Text("Government ID"),
                  subtitle: Text("Govt of India"),
                ),
              ],
            ),
          ),
        ),
      ),

      /// BOTTOM NAV BAR
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1)),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              /// HOME
              IconButton(icon: const Icon(Icons.home), onPressed: () {}),

              /// QR SHARE
              IconButton(
                icon: const Icon(Icons.qr_code),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QRShareScreen()),
                  );
                },
              ),

              /// PROFILE
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

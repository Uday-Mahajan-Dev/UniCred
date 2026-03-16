import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

import 'screens/citizen/citizen_dashboard.dart';
import 'screens/issuer/issuer_dashboard.dart';
import 'screens/employer/employer_dashboard.dart';

////////////////////////////////////////////////////////////
/// MAIN
////////////////////////////////////////////////////////////

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const CredentialGraphApp());
}

////////////////////////////////////////////////////////////
/// APP
////////////////////////////////////////////////////////////

class CredentialGraphApp extends StatelessWidget {
  const CredentialGraphApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UniCred",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: const Color(0xffeef1f7),

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6366f1)),

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xff1f2937),
          ),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            backgroundColor: const Color(0xff6366f1),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xfff2f4fa),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
        ),
      ),

      home: const LandingPage(),
    );
  }
}

////////////////////////////////////////////////////////////
/// NEUMORPHIC CARD
////////////////////////////////////////////////////////////

class NeoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const NeoCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xffeef1f7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 12,
          ),
          BoxShadow(
            color: Color(0xffcfd6e6),
            offset: Offset(6, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: child,
    );
  }
}

////////////////////////////////////////////////////////////
/// LANDING PAGE
////////////////////////////////////////////////////////////

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController controller = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DashboardPage(role: "Citizen")),
        );
      });
    }
  }

  Widget buildCard(IconData icon, String title, String text) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: NeoCard(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff6366f1),
                ),
                child: Icon(icon, color: Colors.white, size: 42),
              ),

              const SizedBox(height: 30),

              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: pageIndex == i ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: pageIndex == i
                ? const Color(0xff6366f1)
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void nextPage() {
    if (pageIndex < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RoleSelectionPage()),
      );
    }
  }

  void prevPage() {
    if (pageIndex > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),

          indicator(),

          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (i) {
                setState(() {
                  pageIndex = i;
                });
              },
              children: [
                buildCard(
                  Icons.account_tree,
                  "UniCred",
                  "Universal infrastructure for verified credentials used by governments, universities and employers.",
                ),

                buildCard(
                  Icons.auto_awesome,
                  "Powerful Features",
                  "AI Resume Builder\nCredential Wallet\nEmployer Verification\nIssuer Management",
                ),

                buildCard(
                  Icons.security,
                  "Secure Infrastructure",
                  "Firebase Authentication\nBlockchain Anchoring\nCryptographic Verification\nCloud Security",
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
            child: Row(
              children: [
                if (pageIndex > 0)
                  ElevatedButton(
                    onPressed: prevPage,
                    child: const Text("Back"),
                  ),

                const Spacer(),

                ElevatedButton(
                  onPressed: nextPage,
                  child: Text(pageIndex == 2 ? "Get Started" : "Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// ROLE SELECTION
////////////////////////////////////////////////////////////

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  Widget roleCard(
    BuildContext context,
    IconData icon,
    String role,
    String desc,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LoginPage(role: role)),
        );
      },

      child: SizedBox(
        width: 300,
        child: NeoCard(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff6366f1),
                ),
                child: Icon(icon, size: 32, color: Colors.white),
              ),

              const SizedBox(height: 18),

              Text(
                role,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                desc,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Your Role")),

      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              roleCard(
                context,
                Icons.person,
                "Citizen",
                "Manage credentials, wallet and AI resume",
              ),

              roleCard(
                context,
                Icons.school,
                "Issuer",
                "Issue verified credentials to citizens",
              ),

              roleCard(
                context,
                Icons.business,
                "Employer",
                "Verify credentials instantly",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// LOGIN PAGE
////////////////////////////////////////////////////////////

class LoginPage extends StatefulWidget {
  final String role;

  const LoginPage({super.key, required this.role});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> loginUser() async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FirebaseLoadingScreen()),
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DashboardPage(role: widget.role)),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Login failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width > 500 ? 420 : width * 0.9,

          child: NeoCard(
            padding: const EdgeInsets.all(32),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified_user,
                  size: 50,
                  color: Color(0xff6366f1),
                ),

                const SizedBox(height: 15),

                Text(
                  "${widget.role} Login",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginUser,
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// FIREBASE LOADING
////////////////////////////////////////////////////////////

class FirebaseLoadingScreen extends StatelessWidget {
  const FirebaseLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

////////////////////////////////////////////////////////////
/// DASHBOARD REDIRECT
////////////////////////////////////////////////////////////

class DashboardPage extends StatefulWidget {
  final String role;

  const DashboardPage({super.key, required this.role});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    openDashboard();
  }

  void openDashboard() {
    Future.delayed(const Duration(milliseconds: 600), () {
      if (widget.role == "Citizen") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CitizenDashboard()),
        );
      } else if (widget.role == "Issuer") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const IssuerDashboard()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const EmployerDashboard()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

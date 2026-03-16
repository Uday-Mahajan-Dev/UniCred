import '../models/credential.dart';

class DemoData {
  static List<Credential> credentials = [
    Credential(title: "B.Tech Degree", issuer: "ABC University", date: "2024"),

    Credential(title: "Government ID", issuer: "Govt of India", date: "2023"),
  ];

  static void addCredential(Credential credential) {
    credentials.add(credential);
  }
}

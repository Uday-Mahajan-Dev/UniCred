class Credential {
  final String title;
  final String issuer;
  final String date;
  final bool verified;

  Credential({
    required this.title,
    required this.issuer,
    required this.date,
    this.verified = true,
  });
}

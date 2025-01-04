/// Represents a single contributor of Energize.
class Contributor {
  final String name;
  final String? contributionLine1; // ListTile subtitle line 1
  final String? contributionLine2; // ListTile subtitle line 2
  final String? assetUrl;

  Contributor({
    required this.name,
    this.contributionLine1,
    this.contributionLine2,
    this.assetUrl,
  });
}

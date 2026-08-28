/// Describes an unsuccessful Open Food Facts text-search response.
class OpenFoodFactsSearchHttpException implements Exception {
  final int statusCode;
  final String? reasonPhrase;

  const OpenFoodFactsSearchHttpException(this.statusCode, this.reasonPhrase);

  @override
  String toString() {
    final reason = reasonPhrase == null ? '' : ' ($reasonPhrase)';
    return 'Open Food Facts search returned HTTP $statusCode$reason';
  }
}

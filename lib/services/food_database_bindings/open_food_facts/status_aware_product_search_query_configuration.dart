import 'dart:io';
import 'package:http/http.dart' show Response;
import 'package:openfoodfacts/openfoodfacts.dart';
import 'open_food_facts_search_http_exception.dart';

/// Adds an explicit HTTP status error to Open Food Facts text searches.
class StatusAwareProductSearchQueryConfiguration
    extends ProductSearchQueryConfiguration {
  StatusAwareProductSearchQueryConfiguration({
    required super.parametersList,
    required super.version,
    super.language,
    super.country,
  });

  @override
  Future<Response> getResponse(User? user, UriProductHelper uriHelper) async {
    final response = await super.getResponse(user, uriHelper);

    if (response.statusCode != HttpStatus.ok) {
      throw OpenFoodFactsSearchHttpException(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    return response;
  }
}

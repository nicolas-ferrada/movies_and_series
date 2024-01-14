import 'package:http/http.dart' as http;

import 'api.dart';

class ApiCall {
  Future<http.Response> apiCall({
    required String endpoint,
  }) async {
    try {
      if (Api.key == null || Api.key!.isEmpty) {
        throw Exception('Api key not found');
      }
      Uri url = Uri.parse("${Api.baseUrl}$endpoint?api_key=${Api.key!}");
      return await http.get(url);
    } catch (_) {
      rethrow;
    }
  }
}

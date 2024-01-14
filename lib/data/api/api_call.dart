import 'package:http/http.dart' as http;

import 'api.dart';

class ApiCall {
  Future<http.Response> apiCall({
    required String endpoint,
  }) async {
    try {
      if (Api.key == null) throw Exception('Api key not found');
      Uri url = Uri.parse(Api.baseUrl + endpoint);
      return await http.get(url, headers: {'Authorization': Api.key!});
    } catch (_) {
      rethrow;
    }
  }
}

import 'package:http/http.dart' as http;

import '../api/api.dart';

class ApiCallService {
  Future<String> apiCall({
    required String endpoint,
  }) async {
    try {
      if (Api.key == null || Api.key!.isEmpty) {
        throw Exception('Api key not found');
      }
      Uri url = Uri.parse("${Api.baseUrl}$endpoint?api_key=${Api.key!}");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Response error: ${response.body}');
      }
    } catch (_) {
      rethrow;
    }
  }
}

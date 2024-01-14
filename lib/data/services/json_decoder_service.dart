import 'dart:convert';

class JsonDecoderService {
  List<Map<String, dynamic>> getListFromRawData({
    required String rawData,
  }) {
    try {
      Map<String, dynamic> json = jsonDecode(rawData);
      if (json.isEmpty || !json.containsKey('results')) {
        throw Exception('Empty response while decoding json');
      }

      final List<Map<String, dynamic>> jsonList = json['results'];
      return jsonList;
    } catch (_) {
      rethrow;
    }
  }
}

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

      final List<dynamic> dynamicList = json['results'];

      // Convert dynamic list to list of maps
      final List<Map<String, dynamic>> jsonList =
          dynamicList.cast<Map<String, dynamic>>();

      return jsonList;
    } catch (_) {
      rethrow;
    }
  }
}

import 'package:movies_and_series/data/services/api_call_service.dart';

import '../api/api.dart';

class SeriesPopularityApi {
  Future<dynamic> getRawPopularitySeries() async {
    try {
      return ApiCallService().apiCall(endpoint: Api.seriesPopularityEndpoint);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:movies_and_series/data/services/api_call_service.dart';

import '../api/api.dart';

class SeriesRatingApi {
  Future<dynamic> getRawRatingSeries() async {
    try {
      return ApiCallService().apiCall(endpoint: Api.seriesTopRatedEndpoint);
    } catch (e) {
      rethrow;
    }
  }
}

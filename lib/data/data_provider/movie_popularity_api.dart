import 'package:movies_and_series/data/services/api_call_service.dart';

import '../api/api.dart';

class MoviePopularityApi {
  Future<dynamic> getRawPopularityMovie() async {
    try {
      return ApiCallService().apiCall(endpoint: Api.moviePopularityEndpoint);
    } catch (e) {
      rethrow;
    }
  }
}

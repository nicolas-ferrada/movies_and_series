import 'package:movies_and_series/data/services/api_call_service.dart';

import '../api/api.dart';

class MovieRatingApi {
  Future<dynamic> getTopRatedMovies() async {
    try {
      return ApiCallService().apiCall(endpoint: Api.movieTopRatedEndpoint);
    } catch (e) {
      rethrow;
    }
  }
}

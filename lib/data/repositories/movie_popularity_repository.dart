import 'package:movies_and_series/data/services/json_decoder_service.dart';

import '../data_provider/movie_popularity_api.dart';
import '../models/movie.dart';

class MoviePopularityRepository {
  final MoviePopularityApi rawDataProvider;
  MoviePopularityRepository({
    required this.rawDataProvider,
  });

  Future<List<Movie>> getPopularityMovieList() async {
    try {
      // Get raw data from API
      final dynamic rawData = await rawDataProvider.getRawPopularityMovie();

      // Get list of maps from raw data
      final List<Map<String, dynamic>> jsonList =
          JsonDecoderService().getListFromRawData(rawData: rawData);

      // Convert list of maps to list of objects
      final List<Movie> movieList =
          jsonList.map((item) => Movie.fromMap(map: item)).toList();

      return movieList;
    } catch (e) {
      rethrow;
    }
  }
}

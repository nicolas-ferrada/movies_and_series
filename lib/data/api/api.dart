import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String? key = dotenv.env['APIKEY'];
  static const String baseUrl = 'https://api.themoviedb.org/3/';

  // Endpoints
  static const String seriesTopRatedEndpoint = 'tv/top_rated';
  static const String seriesPopularityEndpoint = 'tv/popular';
  static const String movieTopRatedEndpoint = 'movie/top_rated';
  static const String moviePopularityEndpoint = 'movie/popular';

  // Images
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w300/';
}

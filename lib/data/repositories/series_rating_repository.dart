import 'package:movies_and_series/data/data_provider/series_rating_api.dart';
import 'package:movies_and_series/data/services/json_decoder_service.dart';

import '../models/series.dart';

class SeriesRatingRepository {
  final SeriesRatingApi rawDataProvider;
  SeriesRatingRepository({
    required this.rawDataProvider,
  });

  Future<List<Series>> getRatingSeries() async {
    try {
      // Get raw data from API
      final dynamic rawData = await rawDataProvider.getRawRatingSeries();

      // Get list of maps from raw data
      final List<Map<String, dynamic>> jsonList =
          JsonDecoderService().getListFromRawData(rawData: rawData);

      // Convert list of maps to list of objects
      final List<Series> seriesList =
          jsonList.map((item) => Series.fromMap(map: item)).toList();

      return seriesList;
    } catch (e) {
      rethrow;
    }
  }
}

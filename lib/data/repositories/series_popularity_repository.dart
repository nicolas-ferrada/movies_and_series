import 'package:movies_and_series/data/data_provider/series_popularity_api.dart';
import 'package:movies_and_series/data/services/json_decoder_service.dart';

import '../models/series.dart';

class SeriesPopularityRepository {
  final SeriesPopularityApi rawDataProvider;
  SeriesPopularityRepository({
    required this.rawDataProvider,
  });

  Future<List<Series>> getPopularitySeries() async {
    try {
      // Get raw data from API
      final dynamic rawData = await rawDataProvider.getRawPopularitySeries();

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

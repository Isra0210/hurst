import 'package:dio/dio.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

class TimeSerieRepository {
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
  ));

  Future<TimeSerieViewModel?> getTimeSeries({
    required String functionQuery,
    required String symbolQuery,
    required String filterQuery,
  }) async {
    final baseUrl =
        "https://www.alphavantage.co/query?function=$functionQuery&symbol=$symbolQuery&apikey=demo";

    try {
      final Response<Map?> response = await _dio.get(baseUrl);
      final castResponse = TimeSerieViewModel.fromJson(response.data, filterQuery);
      return castResponse;
    } on DioException catch (e) {
      //TODO call method report error
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        //TODO call method report error
        print(e.requestOptions);
        print('${e.message} Error Message');
      }
    } catch (error) {
      //TODO call method report error
      print(error);
      rethrow;
    }

    return null;
  }
}

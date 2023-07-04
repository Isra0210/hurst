import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/pages/home/cubit/time_serie/time_serie_state.dart';
import 'package:hurst/repository/api/time_serie_repository.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

class TimeSerieCubit extends Cubit<TimeSerieState> {
  final TimeSerieRepository _repository;

  TimeSerieCubit(this._repository) : super(TimeSerieLoadingState()) {
    getTimeSeries();
  }

  void getTimeSeries() async {
    try {
      final TimeSerieViewModel? intraday = await _repository.getTimeSeries(
        functionQuery: 'TIME_SERIES_INTRADAY',
        symbolQuery: 'IBM&interval=5min',
        filterQuery: '5min',
      );

      final TimeSerieViewModel? dailyAdjusted = await _repository.getTimeSeries(
        functionQuery: 'TIME_SERIES_DAILY_ADJUSTED',
        symbolQuery: 'IBM',
        filterQuery: 'Daily',
      );

      List<TimeSerieViewModel> concatResponse = [];

      if (intraday != null && dailyAdjusted != null) {
        concatResponse.add(intraday);
        concatResponse.add(dailyAdjusted);
      }

      emit(TimeSerieLoadedState(concatResponse));
    } catch (e) {
      emit(TimeSerieErrorState(e.toString()));
    }
  }
}

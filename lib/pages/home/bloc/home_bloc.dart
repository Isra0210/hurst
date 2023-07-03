import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/pages/home/bloc/home_events.dart';
import 'package:hurst/pages/home/bloc/home_state.dart';
import 'package:hurst/repository/api/time_serie_repository.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

class TimeSerieBloc extends Bloc<TimeSerieEvent, TimeSerieState> {
  final TimeSerieRepository _repository;

  TimeSerieBloc(this._repository) : super(TimeSerieLoadingState()) {
    on<LoadTimeSerieEvent>((event, emit) async {
      emit(TimeSerieLoadingState());
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
        
        if(intraday != null && dailyAdjusted != null){
          concatResponse.add(intraday);
          concatResponse.add(dailyAdjusted);
        }
        
        emit(TimeSerieLoadedState(concatResponse));
      } catch (e) {
        emit(TimeSerieErrorState(e.toString()));
      }
    });
  }
}

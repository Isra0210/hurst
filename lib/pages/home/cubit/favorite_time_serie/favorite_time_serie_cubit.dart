import 'package:bloc/bloc.dart';
import 'package:hurst/pages/home/cubit/favorite_time_serie/favorite_time_serie_state.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

class FavoriteTimeSerieCubit extends Cubit<FavoriteTimeSerieState> {
  List<TimeSerieViewModel> favoriteList = [];

  FavoriteTimeSerieCubit({TimeSerieViewModel? timeSerie})
      : super(FavoriteTimeSerieState([timeSerie])) {
    addFavoriteTimeSerie(timeSerie);
    removeFavoriteTimeSerie(timeSerie);
  }

  void addFavoriteTimeSerie(TimeSerieViewModel? timeSerie) {
    if (timeSerie != null) {
      favoriteList.add(timeSerie);
      emit(FavoriteTimeSerieState(favoriteList));
    }
  }

  void removeFavoriteTimeSerie(TimeSerieViewModel? timeSerie) {
    if (timeSerie != null) {
      favoriteList.remove(timeSerie);
      emit(FavoriteTimeSerieState(favoriteList));
    }
  }
}

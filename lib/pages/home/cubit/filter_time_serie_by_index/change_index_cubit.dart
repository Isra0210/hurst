import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/pages/home/cubit/filter_time_serie_by_index/change_index_state.dart';

class ChangeIndexCubit extends Cubit<ChangeIndexState> {
  int index;

  ChangeIndexCubit(this.index) : super(UpdateIndexState(index)) {
    updateIndexList(index);
  }

  void updateIndexList(int value) {
    emit(UpdateIndexState(value));
  }
}

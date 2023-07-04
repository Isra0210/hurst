import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/pages/time_serie_details/cubit/oreder_list/sort_list_state.dart';

class SortListCubit extends Cubit<SortListState> {
  Map<String, dynamic> sortList = {};

  SortListCubit({Map<String, dynamic>? sort})
      : super(SortListState(sort ?? {})) {
    addSortList(sort);
  }

  void addSortList(Map<String, dynamic>? sort) {
    if (sort != null) {
      sortList = {"by": sort["by"], "as": sort["as"]};
      emit(SortListState(sortList));
    }
  }
}

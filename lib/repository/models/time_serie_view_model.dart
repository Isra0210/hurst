import 'package:equatable/equatable.dart';
import 'package:hurst/repository/models/meta_data_view_model.dart';

class TimeSerieViewModel implements Equatable {
  TimeSerieViewModel({
    required this.metaData,
    required this.timeSerie,
  });

  final MetaDataViewModel metaData;
  final Map timeSerie;

  @override
  List<Object?> get props => [
        metaData,
        timeSerie,
      ];

  @override
  bool? get stringify => true;

  factory TimeSerieViewModel.fromJson(Map? json, String filter) =>
      TimeSerieViewModel(
        metaData: MetaDataViewModel.fromMap(json?["Meta Data"]),
        timeSerie: json?["Time Series ($filter)"],
      );

  @override
  String toString() => "metaData: $metaData, timeSerie: $timeSerie";
}

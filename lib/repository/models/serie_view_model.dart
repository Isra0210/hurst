import 'package:equatable/equatable.dart';

class SerieViewModel implements Equatable {
  SerieViewModel({
    required this.id,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    this.adjustedClose,
    this.dividendAmount,
    this.splitCoefficient,
  });

  final String id;
  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;
  final String? adjustedClose;
  final String? dividendAmount;
  final String? splitCoefficient;

  @override
  List<Object?> get props => [
        open,
        high,
        low,
        close,
        volume,
        adjustedClose,
        dividendAmount,
        splitCoefficient,
      ];

  @override
  bool? get stringify => true;

  factory SerieViewModel.fromMap(Map json) => SerieViewModel(
        id: '',
        open: json[""],
        high: json[""],
        low: json[""],
        close: json[""],
        volume: json[""],
        adjustedClose: json[""],
        dividendAmount: json[""],
        splitCoefficient: json[""],
      );

  @override
  String toString() => "id: $id, open: $open, close: $close";
}

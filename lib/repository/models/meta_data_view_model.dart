import 'package:equatable/equatable.dart';

class MetaDataViewModel implements Equatable {
  MetaDataViewModel({
    required this.information,
    required this.symbol,
    required this.lastRefreshed,
    this.interval,
    required this.outputSize,
    required this.timezone,
  });

  final String information;
  final String symbol;
  final String lastRefreshed;
  final String? interval;
  final String outputSize;
  final String timezone;

  @override
  List<Object?> get props => [
        information,
        symbol,
        lastRefreshed,
        interval ?? '',
        outputSize,
        timezone,
      ];

  @override
  bool? get stringify => true;

  factory MetaDataViewModel.fromMap(Map json) => MetaDataViewModel(
        information: json["1. Information"],
        symbol: json["2. Symbol"],
        lastRefreshed: json["3. Last Refreshed"],
        interval: json["4. Interval"] ?? '',
        outputSize: json["4. Interval"] == null
            ? json["4. Output Size"]
            : json["5. Output Size"],
        timezone: json["4. Interval"] == null
            ? json["5. Time Zone"]
            : json["6. Time Zone"],
      );

  @override
  String toString() =>
      "information: $information, symbol: $symbol, lastRefreshed: $lastRefreshed";
}

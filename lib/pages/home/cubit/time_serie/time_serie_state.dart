import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

@immutable
abstract class TimeSerieState extends Equatable {}

class TimeSerieLoadingState extends TimeSerieState {
  @override
  List<Object?> get props => [];
}

class TimeSerieLoadedState extends TimeSerieState {
  final List<TimeSerieViewModel> timeSeries;
  
  TimeSerieLoadedState(this.timeSeries);
  @override
  List<Object?> get props => [timeSeries];
}

class TimeSerieErrorState extends TimeSerieState {
  final String error;
  TimeSerieErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

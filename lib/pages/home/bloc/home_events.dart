import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TimeSerieEvent extends Equatable {
  const TimeSerieEvent();
}

class LoadTimeSerieEvent extends TimeSerieEvent {
  @override
  List<Object?> get props => [];
}

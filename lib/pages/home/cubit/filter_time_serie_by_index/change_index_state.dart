import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ChangeIndexState extends Equatable {}

class InitialIndexState extends ChangeIndexState {
  final int index;
  InitialIndexState(this.index);
  @override
  List<Object?> get props => [index];
}

class UpdateIndexState extends ChangeIndexState {
  final int index;
  UpdateIndexState(this.index);
  @override
  List<Object?> get props => [index];
}

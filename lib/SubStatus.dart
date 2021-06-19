import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:letters_to_juliet/Sub.dart';

@immutable
abstract class SubState extends Equatable {
  SubState() : super();
}

class SubsUpdated extends SubState {
  final List<Children> datas;

  SubsUpdated(this.datas);
  @override
  List<Object?> get props => [datas];
}

class SubsLoaded extends SubState {
  final List<Children> datas;

  SubsLoaded(this.datas);

  @override
  List<Object?> get props => [datas];


}

class SubEmpty extends SubState {
  @override
  List<Object?> get props => [];
}

class SubLoading extends SubState {
  @override
  List<Object?> get props => [];
}

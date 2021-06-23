import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:letters_to_juliet/models/Sub.dart';

@immutable
abstract class SubState  {

}

class SubsUpdated extends SubState {
  final List<Children> datas;

  SubsUpdated(this.datas);

}

class SubsLoaded extends SubState {
  final List<Children> datas;

  SubsLoaded(this.datas);




}

class SubEmpty extends SubState {

}

class SubLoading extends SubState {

}

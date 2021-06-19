import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'Sub.dart';

@immutable
abstract class SubEvent extends Equatable {

}

class ItemClicked extends SubEvent{

  final String itemId;

  ItemClicked(this.itemId);


  @override
  List<Object?> get props => [itemId];
}


class ItemsFetched extends SubEvent{
  final List<Children> subs;

  ItemsFetched(this.subs);

  @override
  List<Object?> get props => subs;
}

class FetchItem extends SubEvent{
  @override
  List<Object?> get props => [];

}
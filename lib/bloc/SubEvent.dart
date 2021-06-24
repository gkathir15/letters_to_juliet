import 'package:flutter/material.dart';
import 'package:letters_to_juliet/models/Sub.dart';


@immutable
abstract class SubEvent {

}

class ItemClicked extends SubEvent{

  final String itemId;

  ItemClicked(this.itemId);

}


class ItemsFetched extends SubEvent{
  final List<Children> subs;

  ItemsFetched(this.subs);

 }

class FetchItem extends SubEvent{

}
class EndOfListReached extends SubEvent{


}
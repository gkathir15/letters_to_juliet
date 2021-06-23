import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letters_to_juliet/RedditClient.dart';
import 'package:letters_to_juliet/models/Sub.dart';
import 'package:letters_to_juliet/bloc/SubEvent.dart';
import 'package:letters_to_juliet/bloc/SubStatus.dart';

class SubBloc extends Bloc<SubEvent, SubState> {
  final RedditClient _client;
  final List<Children>?  _subList = [];


  SubBloc(SubState initialState, this._client) : super(initialState);

  @override
  Stream<SubState> mapEventToState(SubEvent event) async* {
    if (event is ItemClicked) {
      var clickedId = (event).itemId;
      var data = (state as SubsLoaded).datas;

      for (var value in data) {
        if (value.data!.id == clickedId) {
          value.data!.isMarked = true;
        }
      }
      yield SubsUpdated(data);
    } else if (event is FetchItem) {
      var data = (await _client.fetch()).data!.children;
      _subList!.addAll(data!);
      yield SubsLoaded(_subList!);
    }else if(event is EndOfListReached)
      {
        var data = (await _client.fetch()).data!.children;
        _subList!.addAll(data!);
        //print("bloc length ${_subList!.toSet().toList().length}");
        yield SubsLoaded(_subList!);
      }
  }
}

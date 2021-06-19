import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letters_to_juliet/RedditClient.dart';
import 'package:letters_to_juliet/SubEvent.dart';
import 'package:letters_to_juliet/SubStatus.dart';
import 'package:bloc/bloc.dart';

class SubBloc extends Bloc<SubEvent,SubState>{
  final RedditClient _client;
  SubBloc(SubState initialState, this._client) : super(initialState);


  @override
  Stream<SubState> mapEventToState(SubEvent event) async*{

    if(event is ItemClicked)
      {
        var clickedId = (event).itemId;
       var data =  (state as SubsLoaded).datas;

       for (var value in data) {
         if(value.data!.id==clickedId)
           {
             value.data!.isMarked = true;
           }
       }
        yield SubsUpdated(data);
      }else if (event is FetchItem)
          {
            var data =(await  _client.fetch()).data!.children;
            yield SubsLoaded(data!);
          }
  }
  
}


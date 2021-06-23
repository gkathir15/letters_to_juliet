import 'dart:async';
import 'dart:convert';
import 'package:letters_to_juliet/DioPerf.dart';

import 'models/Sub.dart';

class RedditClient {

  final  String _url = "https://www.reddit.com/r/UnsentLetters/top.json";
  final  String _paginateUrl = "https://www.reddit.com/r/UnsentLetters/top.json?after=";
  String? _afterKey;


  Future<Sub> fetch() async {
    if(_afterKey!=null) {
      final response = await getDio().get(_paginateUrl + _afterKey!);
      print(response);
      var resp = Sub.fromJson(response.data);
      _afterKey = resp.data!.after;
      return resp;
    }else {
      final response = await getDio().get(_url);
      print(response);
      var resp = Sub.fromJson(response.data);
      _afterKey = resp.data!.after;
      return resp;
    }

  }

}

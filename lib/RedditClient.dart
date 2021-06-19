import 'dart:async';
import 'dart:convert';
import 'package:letters_to_juliet/DioPerf.dart';

import 'Sub.dart';

class RedditClient {

  final  String url = "https://www.reddit.com/r/UnsentLetters/top.json";
  //final  String url = https://www.reddit.com/r/UnsentLetters/top.json?after=t3_o3igj4


  Future<Sub> fetch() async {
    final response = await getDio().get(url);
      return Sub.fromJson(response.data);

  }
}

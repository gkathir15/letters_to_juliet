import 'dart:async';
import 'dart:convert';
import 'package:letters_to_juliet/DioPerf.dart';

import 'Sub.dart';

class RedditClient {

  final  String url = "https://www.reddit.com/r/UnsentLetters/new.json";


  Future<Sub> fetch() async {
    final response = await getDio().get(url);
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return Sub.fromJson(results);
    } else {
      throw results;
    }
  }
}

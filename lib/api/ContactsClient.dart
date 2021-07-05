import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:letters_to_juliet/DioPerf.dart';
import 'package:letters_to_juliet/models/Contacts.dart';

class ContactsClient {
  final String _url =
      "http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts";

  Future<List<Contacts>> fetch() async {
    final Response response = await getDio().get(_url);
    print(response);
    return List<Contacts>.from(response.data.map((model) => Contacts.fromJson(model)));


  }
}

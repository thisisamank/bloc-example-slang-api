import 'dart:convert';

import 'package:bloc_test2/data/models/slang_model.dart';
import 'package:http/http.dart' as http;

class SlangProvider {
  final _baseUrl =
      'https://evilinsult.com/generate_insult.php?lang=en&type=json';
  final _successCode = 200;

  Future<SlangModel> getSlang() async {
    final response = await http.get(_baseUrl);
    return _parseSlangJson(response);
  }

  SlangModel _parseSlangJson(http.Response response) {
    if (response.statusCode == _successCode) {
      final jsonRes = jsonDecode(response.body);
      return SlangModel.fromJson(jsonRes);
    } else
      throw new Exception('Couldn\'t get a slang');
  }
}

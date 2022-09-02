import 'dart:async';
import 'dart:convert';

import 'package:flutter_trip/model/home_model.dart';
import 'package:http/http.dart' as http;

const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';
// const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';
// https://www.devio.org/io/flutter_app/json/home_page.json
//     'http://www.devio.org/io/flutter_app/json/home_page.json';

///首页大接口
class HomeDao {
  final headerself = {
    'Content-Type': 'application/json',
    'cors': 'cors',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,GET',
    'Access-Control-Max-Age': '3600',
    'Access-Control-Allow-Headers': 'x-requested-with,Authorization',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Expose-Headers': '*',
    'Cookie': '',
  };
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL, headers: {
      'Content-Type': 'application/json',
      'cors': 'cors',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST,GET',
      'Access-Control-Max-Age': '3600',
      'Access-Control-Allow-Headers': 'x-requested-with,Authorization',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Expose-Headers': '*',
      'Cookie': '',
    });
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}

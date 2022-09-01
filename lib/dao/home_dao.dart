import 'dart:async';
import 'dart:convert';

import 'package:flutter_trip/model/home_model.dart';
import 'package:http/http.dart' as http;

class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;

  UserAgentClient(this.userAgent, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    request.headers['Access-Control-Allow-Origin'] = '*';
    request.headers['Access-Control-Allow-Methods'] =
        'POST, GET, OPTIONS, PUT, DELETE, HEAD';
    // request.headers['Access-Control-Allow-Origin'] = '*';
    // request.headers['Access-Control-Allow-Credentials'] = true;
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }
}

const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';
// https://www.devio.org/io/flutter_app/json/home_page.json
//     'http://www.devio.org/io/flutter_app/json/home_page.json';

///首页大接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    // FutureBuilder(

    // )
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
// class HomeDao {
//   static Future<HomeModel> fetch() async {
//     final response = await http.get(HOME_URL);
//     if (response.statusCode == 200) {
//       Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
//       var result = json.decode(utf8decoder.convert(response.bodyBytes));
//       return HomeModel.fromJson(result);
//     } else {
//       throw Exception('Failed to load home_page.json');
//     }
//   }
// }


import 'package:flutterapp/model/response/api_response.dart';
import 'package:flutterapp/model/response/response.dart';
import 'package:flutterapp/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApi {
  static Future<ApiResponse> login(String login, String senha) async {
    try {
      var url = 'http://172.100.10.101:8141/user/login';

      final params = {"login": login, "password": senha};
      final Map<String, String> header = {
        "Content-Type": "application/json",
        "charset": "utf-8"
      };

      var response = await http.post(
        url,
        body: json.encode(params),
        headers: header,
      );

      String body = utf8.decode(response.body.codeUnits);

      Map map = json.decode(body);

      if (response.statusCode == 200) {
        return ApiResponse.ok(User.fromJson(map));
      }
      return ApiResponse.error(Response.fromJson(map));
    } catch (error, exception) {
      print("Error no login $error > $exception");
      return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}

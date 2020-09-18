import 'package:flutterapp/model/response/api_response.dart';
import 'package:flutterapp/model/response/response.dart';
import 'package:flutterapp/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApi {
  static Future<ApiResponse> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      final params = {"username": login, "password": senha};
      final Map<String, String> header = {"Content-Type": "application/json"};

      var response = await http.post(
        url,
        body: json.encode(params),
        headers: header,
      );

      Map map = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(map);
        user.save();
        return ApiResponse.ok(user);
      }
      return ApiResponse.error(Response.fromJson(map));
    } catch (error, exception) {
      print("Error no login $error > $exception");
      return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}

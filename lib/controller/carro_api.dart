import 'dart:convert';

import 'package:flutterapp/model/carro.dart';
import 'package:http/http.dart' as http;

class CarroApi {
  static Future<List<Carro>> getCarros() async{
    var url = "https://carros-springboot.herokuapp.com/api/v1/carros";

    var response = await http.get(url);

    List listCarros = json.decode(response.body);
    
    return listCarros.map((map) => Carro.fromJson(map)).toList();
  }
}

import 'dart:convert';

import 'package:flutterapp/model/carro.dart';
import 'package:http/http.dart' as http;

class TipoCarro{
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarroApi {
  static Future<List<Carro>> getCarros(String tipo) async{

    var url = "https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo";

    var response = await http.get(url);

    List listCarros = json.decode(response.body);
    
    return listCarros.map((map) => Carro.fromJson(map)).toList();
  }
}

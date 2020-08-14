import 'package:flutterapp/model/response/response.dart';

class ApiResponse<T>{
  bool ok;
  String msg;
  T result;

  ApiResponse.ok(this.result){
    ok = true;
  }

  ApiResponse.error(this.result){
    Response response = this.result as Response;
    this.msg = response.error;
    ok = false;
  }
}
import 'package:flutter/material.dart';
import 'package:flutterapp/controller/login_api.dart';
import 'package:flutterapp/model/response/api_response.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/utils/alerts.dart';
import 'package:flutterapp/utils/nav.dart';
import 'package:flutterapp/widget/app_button.dart';
import 'package:flutterapp/widget/app_text.dart';


// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tfLogin = new TextEditingController(text: "user");
  final _tfSenha = new TextEditingController(text: "123");
  final _formKey = GlobalKey<FormState>();
  final _focusSenha = FocusNode();
  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Carros",
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText("Login", "Digite o login",
                controller: _tfLogin,
                validator: _validatelogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha),
            SizedBox(height: 10),
            AppText(
              "Senha",
              "Digite a senha",
              password: true,
              controller: _tfSenha,
              validator: _validateSenha,
              textInputAction: TextInputAction.next,
              focusNode: _focusSenha,
            ),
            SizedBox(height: 10),
            AppButton(
              "Login",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickLogin() async {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) return;

    String login = _tfLogin.text;
    String senha = _tfSenha.text;

    setState(() { // só usa no stateful e serve para redesenhar a tela novamente
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      toastAlert(response.msg);
    }

    setState(() { // só usa no stateful e serve para redesenhar a tela novamente
      _showProgress = false;
    });
  }

  String _validatelogin(String text) {
    if (text.isEmpty) return "Digite o login";
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) return "Digite a senha";
    if (text.length < 3) return "A senha deve ser maior";
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

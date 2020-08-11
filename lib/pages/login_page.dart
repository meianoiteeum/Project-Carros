import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tfLogin = new TextEditingController();
  final _tfSenha = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusSenha = FocusNode();

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
            _text(
              "Login",
              "Digite o login",
              controller: _tfLogin,
              validator: _validatelogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha
            ),
            SizedBox(height: 10),
            _text(
              "Senha",
              "Digite a senha",
              password: true,
              controller: _tfSenha,
              validator: _validateSenha,
              textInputAction: TextInputAction.next,
              focusNode: _focusSenha,
            ),
            SizedBox(height: 10),
            _button("Login", _onClickLogin),
          ],
        ),
      ),
    );
  }

  Container _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _text(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    FocusNode focusNode,
        FocusNode nextFocus,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text){
        if(nextFocus != null)
          FocusScope.of(context).requestFocus(_focusSenha);
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  void _onClickLogin() {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) return;

    String login = _tfLogin.text;
    String senha = _tfSenha.text;
    print("Login: $login, Senha: $senha");
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

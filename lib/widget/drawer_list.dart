import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/model/usuario.dart';
import 'package:flutterapp/pages/login_page.dart';
import 'package:flutterapp/utils/nav.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Usuario> future = Usuario.get();
    return Drawer(
      child: ListView(
        children: <Widget>[
          FlutterLogo(
            size: 30,
          ),
          FutureBuilder<Usuario>(
            future: future,
            builder: (context, snapshot){
              Usuario user = snapshot.data;
              return user != null ? _header(user) : Container();
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Lista de Animais"),
            subtitle: Text("Fofinhos"),
            trailing: Icon(Icons.add_shopping_cart),
            onTap: () => {
              Navigator.pop(context),
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Logout"),
            trailing: Icon(Icons.exit_to_app),
            onTap: () => {
              Navigator.pop(context),
              onTapPage1(context),
            },
          ),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _header(Usuario user) {
    return UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          accountName: Text(user.nome),
          accountEmail: Text(user.email),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(user.urlFoto),
          ),
          // currentAccountPicture: Image.asset(user.urlFoto),
        );
  }

  onTapPage1(context) {
    Usuario.delete();
    push(context, LoginPage(), replace: true);
  }
}
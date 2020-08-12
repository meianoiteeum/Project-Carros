import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/pages/login_page.dart';
import 'package:flutterapp/utils/nav.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          FlutterLogo(
            size: 30,
          ),
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            accountName: Text("Guilherme Costa"),
            accountEmail: Text("tfguilherme.07@gmail.com"),
            currentAccountPicture: Image.asset("assets/images/catinho_1.jpg"),
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

  onTapPage1(context) {
    push(context, LoginPage(), replace: true);
  }
}
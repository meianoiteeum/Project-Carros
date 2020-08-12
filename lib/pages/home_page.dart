import 'package:flutter/material.dart';
import 'package:flutterapp/utils/nav.dart';
import 'package:flutterapp/widget/drawer_list.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return push(context, LoginPage(), replace: true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
        ),
        body: _body(),
        drawer: DrawerList(),
      ),
    );
  }

  _body() {
    return Center(
      child: Text(
        "Guilherme",
        style: TextStyle(
          fontSize: 22
        ),
      ),
    );
  }
}

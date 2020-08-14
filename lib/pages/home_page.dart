import 'package:flutter/material.dart';
import 'package:flutterapp/controller/carro_api.dart';
import 'package:flutterapp/model/carro.dart';
import 'package:flutterapp/utils/nav.dart';
import 'package:flutterapp/widget/carros_listView.dart';
import 'package:flutterapp/widget/drawer_list.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () async {
          return push(context, LoginPage(), replace: true);
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Carros"),
            bottom: TabBar(
              tabs: [
                Tab(text: "Clássicos"),
                Tab(text: "Esportivos"),
                Tab(text: "Luxo"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CarrosListView(),
              CarrosListView(),
              CarrosListView(),
            ],
          ),
          drawer: DrawerList(),
        ),
      ),
    );
  }
}

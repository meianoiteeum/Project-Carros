import 'package:flutter/material.dart';
import 'package:flutterapp/controller/carro_api.dart';
import 'package:flutterapp/model/carro.dart';
import 'package:flutterapp/model/usuario.dart';
import 'package:flutterapp/utils/nav.dart';
import 'package:flutterapp/utils/prefs.dart';
import 'package:flutterapp/widget/carros_listView.dart';
import 'package:flutterapp/widget/drawer_list.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _initiTabs();
  }
  _initiTabs() async{
    _tabController = TabController(length: 3, vsync: this);

    int tabIndex = await Prefs.getInt("tabIdx");

    setState(() {
      _tabController.index = tabIndex;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return push(context, LoginPage(), replace: true);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Carros"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Clássicos"),
              Tab(text: "Esportivos"),
              Tab(text: "Luxo"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CarrosListView(TipoCarro.classicos),
            CarrosListView(TipoCarro.esportivos),
            CarrosListView(TipoCarro.luxo),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }
}

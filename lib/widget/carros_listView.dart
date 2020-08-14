import 'package:flutter/material.dart';
import 'package:flutterapp/controller/carro_api.dart';
import 'package:flutterapp/model/carro.dart';

class CarrosListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    Future<List<Carro>> futureCarros =
    CarroApi.getCarros(); //future retorna um widget

    return FutureBuilder(
      future: futureCarros,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? _listViewCarros(snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Container _listViewCarros(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(14),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];
          return Card(
            color: Colors.white30,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      c.urlFoto ??
                          "https://images.vexels.com/media/users/3/154661/isolated/preview/7288653d1853bbc9f5e2a844ffadb763-silhueta-de-vista-lateral-de-carro-de-luxo-by-vexels.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    "descrição",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      FlatButton(
                        child: const Text('SHARE'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

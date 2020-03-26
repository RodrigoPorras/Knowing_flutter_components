import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes temp')),
      //body: ListView(children: _crearItems()),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((opt) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt + '!'),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.camera_alt),
            trailing: Icon(Icons.delete),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }

}

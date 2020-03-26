import 'package:componentes/src/Utils/icono_string_util.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/Providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItmes(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItmes(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          //Forma de navegacion 1
          //final route = MaterialPageRoute(builder: (context) => AlertPage());
          //Navigator.push(context, route);

          //Forma de navegacion 2
          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Listar Fabricas'),
            onTap: () => Navigator.pushNamed(context, 'listar'),
          ),
          ListTile(
            leading: Icon(Icons.add_business),
            title: Text('Agregar Fabricas'),
            onTap: () => Navigator.pushNamed(context, 'agregar'),
          ),
        ],
      ),
    );
  }
}

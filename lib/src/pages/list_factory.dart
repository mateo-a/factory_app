import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/factory_model.dart';
import 'package:formvalidation/src/providers/factories_provider.dart';

class ListFactory extends StatefulWidget {
  @override
  _ListFactoryState createState() => _ListFactoryState();
}

class _ListFactoryState extends State<ListFactory> {
  final factoriesProvider = new FactoriesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fabricas'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, 'detalle'),
            icon: Icon(Icons.add_business),
          )
        ],
      ),
      body: _crearListado(),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: factoriesProvider.cargarFabricas(),
      builder:
          (BuildContext context, AsyncSnapshot<List<FactoryModel>> snapshot) {
        if (snapshot.hasData) {
          final fabricas = snapshot.data;

          return ListView.builder(
            itemCount: fabricas.length,
            itemBuilder: (context, i) => _crearItem(context, fabricas[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, FactoryModel fabricas) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: (direction) {
        factoriesProvider.borrarFabrica(fabricas.id);
      },
      child: ListTile(
          leading: Icon(Icons.business, size: 40.0),
          title: Text('${fabricas.nombre}'),
          subtitle: Text('Teléfono: ${fabricas.telefono}'),
          isThreeLine: true,
          onTap: () =>
              Navigator.pushNamed(context, 'detalle', arguments: fabricas)),
    );
  }
}

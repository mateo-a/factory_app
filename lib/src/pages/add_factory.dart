import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/factory_model.dart';
import 'package:formvalidation/src/providers/factories_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;

class AddFactory extends StatefulWidget {
  @override
  _AddFactoryState createState() => _AddFactoryState();
}

class _AddFactoryState extends State<AddFactory> {
  final formKey = GlobalKey<FormState>();
  final factoriesProvider = new FactoriesProvider();

  FactoryModel fabrica = new FactoryModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Fabrica'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _crearNombre(),
                _crearDireccion(),
                _crearTelefono(),
                _crearCiudad(),
                _crearPais(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: fabrica.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => fabrica.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre de la fabrica';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearDireccion() {
    return TextFormField(
      initialValue: fabrica.direccion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Dirección'),
      onSaved: (value) => fabrica.direccion = value,
      validator: (value) {
        if (value.length < 5) {
          return 'Ingrese la dirección de la fabrica';
        } else {
          return null;
        }
      },
    );
  }

  _crearTelefono() {
    return TextFormField(
      initialValue: fabrica.telefono.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Teléfono'),
      onSaved: (value) => fabrica.telefono = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Ingrese solo números';
        }
      },
    );
  }

  _crearCiudad() {
    return TextFormField(
      initialValue: fabrica.ciudad,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Ciudad'),
      onSaved: (value) => fabrica.ciudad = value,
      validator: (value) {
        if (value.length < 2) {
          return 'Ingrese la ciudad';
        } else {
          return null;
        }
      },
    );
  }

  _crearPais() {
    return TextFormField(
      initialValue: fabrica.pais,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'País'),
      onSaved: (value) => fabrica.pais = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el país';
        } else {
          return null;
        }
      },
    );
  }

  _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.green,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    print('Todo se validó correctamente');

    factoriesProvider.crearFabrica(fabrica);
  }
}

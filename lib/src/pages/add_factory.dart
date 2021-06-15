import 'package:flutter/material.dart';

class AddFactory extends StatefulWidget {
  @override
  _AddFactoryState createState() => _AddFactoryState();
}

class _AddFactoryState extends State<AddFactory> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fabrica'),
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Dirección'),
      validator: (value) {
        if (value.length < 5) {
          return 'Ingrese la dirección de la fabrica';
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
    print('Todo se validó correctamente');
  }
}

import 'package:flutter/material.dart';

class ListFactory extends StatelessWidget {
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
            child: Column(
              children: [
                // _crearNombre(),
                // _crearDireccion(),
                // _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

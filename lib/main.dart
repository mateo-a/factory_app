import 'package:flutter/material.dart';

import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/add_factory.dart';
import 'package:formvalidation/src/pages/detail_factory.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/list_factory.dart';
import 'package:formvalidation/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        // initialRoute: 'login',
        initialRoute: 'home',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'listar': (BuildContext context) => ListFactory(),
          'agregar': (BuildContext context) => AddFactory(),
          'detalle': (BuildContext context) => DetailFactory(),
        },
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}

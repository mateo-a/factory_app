import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:formvalidation/src/models/factory_model.dart';

class FactoriesProvider {
  final String _url = 'https://flutter-apps-158cd-default-rtdb.firebaseio.com';

  Future<bool> crearFabrica(FactoryModel fabrica) async {
    final url = Uri.parse('$_url/fabricas.json');

    final resp = await http.post(url, body: factoryModelToJson(fabrica));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}

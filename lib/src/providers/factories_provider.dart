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

  Future<bool> edtarFabrica(FactoryModel fabrica) async {
    final url = Uri.parse('$_url/fabricas/${fabrica.id}.json');

    final resp = await http.put(url, body: factoryModelToJson(fabrica));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<FactoryModel>> cargarFabricas() async {
    final url = Uri.parse('$_url/fabricas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<FactoryModel> fabricas = new List();

    if (decodedData == null) return [];

    // Manejo del JSON seleccionando el id y el detalle de factory (fabrica)
    decodedData.forEach((id, fact) {
      final factTemp = FactoryModel.fromJson(fact);
      factTemp.id = id;

      fabricas.add(factTemp);
    });

    print(fabricas);

    return fabricas;
  }

  Future<int> borrarFabrica(String id) async {
    final url = Uri.parse('$_url/fabricas/$id.json');
    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }
}

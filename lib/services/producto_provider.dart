import 'dart:convert';

import 'package:comisariato/models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  final url = 'https://comisariato-f4443-default-rtdb.firebaseio.com';

  //funcion para  crear  el producto
  Future<bool> createProduct(String title, double value, bool avaliable) async {
    final productData = {
      'title': title,
      'value': value,
      'avaliable': avaliable
    };

    final createUrl = Uri.parse('$url/productos.json');
    final resp = await http.post(createUrl, body: json.encode(productData));

    final decodedData = json.decode(resp.body);

    notifyListeners();
    return true;
  }

  Future<List<ProductModel>> readProduct() async {
    final readUrl = Uri.parse('$url/productos.json');

    final List<ProductModel> product = [];
    final resp = await http.get(readUrl);

    final Map<String, dynamic> decodeData = json.decode(resp.body);

    decodeData.forEach((id, prod) {
      final prodTemp = ProductModel.fromJsonMap({"id": id, ...prod});

      product.add(prodTemp);
    });
    print(product);
    return product;
  }
}

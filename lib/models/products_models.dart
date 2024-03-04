import 'package:comisariato/entities/producto_entidad.dart';

class ProductModel {
  final String id;
  final String title;
  final double value;
  final bool avaliable;
  final String photoUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.value,
    required this.avaliable,
    required this.photoUrl,
  });

  factory ProductModel.fromJsonMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        value: json["value"],
        avaliable: json["avaliable"],
        photoUrl: json["photoUrl"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "value": value,
        "avaliable": avaliable,
        "photoUrl": photoUrl,
      };

  Product productEntity() => Product(
        title: title,
        value: value,
        avaliable: avaliable,
      );
}

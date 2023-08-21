import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavourite,
  });
  String image;
  String id;
  bool isFavourite;
  String name;
  String price;
  String description;
  String status;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        isFavourite: false,
        price: json["price"],
        status: json["status"],
      );
  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "status": status,
        "isFavourite": isFavourite,
      };
}

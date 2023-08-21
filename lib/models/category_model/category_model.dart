import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.image,
// required this.email,
  });
  String id;
  String image;
// String email;
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"], image: json["image"],
// email: json["email"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
// "email": email,
      };
}

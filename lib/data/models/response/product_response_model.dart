import 'package:ecommerce_app/data/models/response/category_response_model.dart';
import 'package:ecommerce_app/data/models/response/gallery_response_model.dart';

class ProductResponseModel {
  final int id;
  final String name;
  final int price;
  final String description;
  // final String tags;
  final CategoryResponseModel category;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  List<GalleryResponseModel> galleries;

  ProductResponseModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    // required this.tags,
    required this.category,
    // required this.createdAt,
    // required this.updatedAt,
    required this.galleries,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      // 'tags': tags,
      'category': category.toJson(),
      // 'createdAt': createdAt.toString(),
      // 'updatedAt': updatedAt.toString(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
    };
  }

  int get priceToRupiah {
    return price * 14000;
  }

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      // tags: json['tags'],
      category: CategoryResponseModel.fromJson(json['category']),
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
      galleries: json['galleries']
          .map<GalleryResponseModel>(
              (gallery) => GalleryResponseModel.fromJson(gallery))
          .toList(),
    );
  }
}

import 'package:ecommerce_app/data/models/response/product_response_model.dart';

class CartResponseModel {
  final int id;
  final ProductResponseModel product;
  final int quantity;

  CartResponseModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      id: json['id'],
      product: ProductResponseModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  CartResponseModel copyWith({int? id, ProductResponseModel? product, int? quantity}) {
    return CartResponseModel(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  

  int getTotalPrice() {
    return product.price * quantity * 14000;
  }
}

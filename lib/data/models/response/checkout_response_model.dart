import 'dart:convert';

CheckoutResponseModel checkoutResponseModelFromJson(String str) => CheckoutResponseModel.fromJson(json.decode(str));

String checkoutResponseModelToJson(CheckoutResponseModel data) => json.encode(data.toJson());

class CheckoutResponseModel {
    final Meta meta;
    final Data data;

    CheckoutResponseModel({
        required this.meta,
        required this.data,
    });

    factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) => CheckoutResponseModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
    };
}

class Data {
    final int usersId;
    final String address;
    final int totalPrice;
    final int shippingPrice;
    final String status;
    // final DateTime updatedAt;
    // final DateTime createdAt;
    final int id;
    final List<Item> items;

    Data({
        required this.usersId,
        required this.address,
        required this.totalPrice,
        required this.shippingPrice,
        required this.status,
        // required this.updatedAt,
        // required this.createdAt,
        required this.id,
        required this.items,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        usersId: json["users_id"],
        address: json["address"],
        totalPrice: json["total_price"],
        shippingPrice: json["shipping_price"],
        status: json["status"],
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users_id": usersId,
        "address": address,
        "total_price": totalPrice,
        "shipping_price": shippingPrice,
        "status": status,
        // "updated_at": updatedAt.toIso8601String(),
        // "created_at": createdAt.toIso8601String(),
        "id": id,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    final int id;
    final int usersId;
    final int productsId;
    final int transactionsId;
    final int quantity;
    // final DateTime createdAt;
    // final DateTime updatedAt;
    final Product product;

    Item({
        required this.id,
        required this.usersId,
        required this.productsId,
        required this.transactionsId,
        required this.quantity,
        // required this.createdAt,
        // required this.updatedAt,
        required this.product,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        usersId: json["users_id"],
        productsId: json["products_id"],
        transactionsId: json["transactions_id"],
        quantity: json["quantity"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "products_id": productsId,
        "transactions_id": transactionsId,
        "quantity": quantity,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
    };
}

class Product {
    final int id;
    final String name;
    final double price;
    final String description;
    final String tags;
    final int categoriesId;
    // final dynamic deletedAt;
    // final DateTime createdAt;
    // final DateTime updatedAt;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.tags,
        required this.categoriesId,
        // required this.deletedAt,
        // required this.createdAt,
        // required this.updatedAt,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        price: json["price"]?.toDouble(),
        description: json["description"] ?? '',
        tags: json["tags"] ?? '',
        categoriesId: json["categories_id"] ?? 0,
        // deletedAt: json["deleted_at"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "categories_id": categoriesId,
        // "deleted_at": deletedAt,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
    };
}

class Meta {
    final int code;
    final String status;
    final String message;

    Meta({
        required this.code,
        required this.status,
        required this.message,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
    };
}

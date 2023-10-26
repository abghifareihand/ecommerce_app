
import 'dart:convert';

CheckoutRequestModel checkoutRequestModelFromJson(String str) => CheckoutRequestModel.fromJson(json.decode(str));

String checkoutRequestModelToJson(CheckoutRequestModel data) => json.encode(data.toJson());

class CheckoutRequestModel {
    final String address;
    final List<Item> items;
    final String status;
    final int totalPrice;
    final int shippingPrice;

    CheckoutRequestModel({
        required this.address,
        required this.items,
        required this.status,
        required this.totalPrice,
        required this.shippingPrice,
    });

    factory CheckoutRequestModel.fromJson(Map<String, dynamic> json) => CheckoutRequestModel(
        address: json["address"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        status: json["status"],
        totalPrice: json["total_price"],
        shippingPrice: json["shipping_price"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "status": status,
        "total_price": totalPrice,
        "shipping_price": shippingPrice,
    };
}

class Item {
    final int id;
    final int quantity;

    Item({
        required this.id,
        required this.quantity,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
    };
}

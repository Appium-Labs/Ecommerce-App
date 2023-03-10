import 'OrderHistory.dart';
import 'PaymentCards.dart';
import 'Product.dart';

class User {
  String? sId;
  String? name;
  String? email;
  String? password;
  List<Product>? favourites;
  List<Product>? cartItems;
  List<OrderHistory>? orderHistory;
  List<PaymentCards>? paymentCards;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.favourites,
      this.cartItems,
      this.orderHistory,
      this.paymentCards,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    if (json['favourites'] != null) {
      favourites = <Product>[];
      json['favourites'].forEach((v) {
        favourites?.add(Product.fromJson(v));
      });
    }
    if (json['cart_items'] != null) {
      cartItems = <Product>[];
      json['cart_items'].forEach((v) {
        cartItems?.add(Product.fromJson(v));
      });
    }
    if (json['order_history'] != null) {
      orderHistory = <OrderHistory>[];
      json['order_history'].forEach((v) {
        orderHistory?.add(OrderHistory.fromJson(v));
      });
    }
    if (json['payment_cards'] != null) {
      paymentCards = <PaymentCards>[];
      json['payment_cards'].forEach((v) {
        paymentCards?.add(PaymentCards.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.favourites != null) {
      data['favourites'] = this.favourites?.map((v) => v.toJson()).toList();
    }
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems?.map((v) => v.toJson()).toList();
    }
    if (this.orderHistory != null) {
      data['order_history'] =
          this.orderHistory?.map((v) => v.toJson()).toList();
    }
    if (this.paymentCards != null) {
      data['payment_cards'] =
          this.paymentCards?.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}
class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null ? new User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? password;
  List<Favourites>? favourites;
  List<CartItems>? cartItems;
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
      favourites = <Favourites>[];
      json['favourites'].forEach((v) {
        favourites?.add(new Favourites.fromJson(v));
      });
    }
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    if (json['order_history'] != null) {
      orderHistory = <OrderHistory>[];
      json['order_history'].forEach((v) {
        orderHistory?.add(new OrderHistory.fromJson(v));
      });
    }
    if (json['payment_cards'] != null) {
      paymentCards = <PaymentCards>[];
      json['payment_cards'].forEach((v) {
        paymentCards?.add(new PaymentCards.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Favourites {
  String? sId;
  String? company;
  String? title;
  String? description;
  String? category;
  List<Photos>? photos;
  int? price;
  int? iV;

  Favourites(
      {this.sId,
      this.company,
      this.title,
      this.description,
      this.category,
      this.photos,
      this.price,
      this.iV});

  Favourites.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    company = json['company'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos?.add(new Photos.fromJson(v));
      });
    }
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['company'] = this.company;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    if (this.photos != null) {
      data['photos'] = this.photos?.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}

class Photos {
  String? url;
  String? sId;

  Photos({this.url, this.sId});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}

class OrderHistory {
  String? sId;
  String? productId;
  String? dateOfPurchase;
  int? iV;

  OrderHistory({this.sId, this.productId, this.dateOfPurchase, this.iV});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['product_id'];
    dateOfPurchase = json['date_of_purchase'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['product_id'] = this.productId;
    data['date_of_purchase'] = this.dateOfPurchase;
    data['__v'] = this.iV;
    return data;
  }
}

class PaymentCards {
  String? sId;
  String? company;
  int? number;
  String? userName;
  String? expiryDate;
  int? iV;

  PaymentCards(
      {this.sId,
      this.company,
      this.number,
      this.userName,
      this.expiryDate,
      this.iV});

  PaymentCards.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    company = json['company'];
    number = json['number'];
    userName = json['user_name'];
    expiryDate = json['expiry_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['company'] = this.company;
    data['number'] = this.number;
    data['user_name'] = this.userName;
    data['expiry_date'] = this.expiryDate;
    data['__v'] = this.iV;
    return data;
  }
}

class CartItems {
  String? sId;
  String? company;
  String? title;
  String? description;
  String? category;
  List<Photos>? photos;
  int? price;
  int? iV;

  CartItems(
      {this.sId,
      this.company,
      this.title,
      this.description,
      this.category,
      this.photos,
      this.price,
      this.iV});

  CartItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    company = json['company'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos?.add(new Photos.fromJson(v));
      });
    }
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['company'] = this.company;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    if (this.photos != null) {
      data['photos'] = this.photos?.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}

class OrderHistory {
  String? sId;
  String? productId;
  bool? deliveryStatus;
  String? shippingAddress;
  int? phone;
  String? dateOfPurchase;
  int? iV;

  OrderHistory(
      {this.sId,
      this.productId,
      this.deliveryStatus,
      this.shippingAddress,
      this.phone,
      this.dateOfPurchase,
      this.iV});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['product_id'];
    deliveryStatus = json['delivery_status'];
    shippingAddress = json['shipping_address'];
    phone = json['phone'];
    dateOfPurchase = json['date_of_purchase'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['product_id'] = this.productId;
    data['delivery_status'] = this.deliveryStatus;
    data['shipping_address'] = this.shippingAddress;
    data['phone'] = this.phone;
    data['date_of_purchase'] = this.dateOfPurchase;
    data['__v'] = this.iV;
    return data;
  }
}

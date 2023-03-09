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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['product_id'] = this.productId;
    data['date_of_purchase'] = this.dateOfPurchase;
    data['__v'] = this.iV;
    return data;
  }
}

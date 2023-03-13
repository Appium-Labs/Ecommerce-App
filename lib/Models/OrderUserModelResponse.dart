class OrderUserResponse {
  String? userId;
  String? orderId;

  OrderUserResponse({this.userId, this.orderId});

  OrderUserResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    return data;
  }
}

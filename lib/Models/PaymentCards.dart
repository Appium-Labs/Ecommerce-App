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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['company'] = this.company;
    data['number'] = this.number;
    data['user_name'] = this.userName;
    data['expiry_date'] = this.expiryDate;
    data['__v'] = this.iV;
    return data;
  }
}

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

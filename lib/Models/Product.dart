import 'Photos.dart';

class Product {
  String? sId;
  String? company;
  String? title;
  String? description;
  String? category;
  List<Photos>? photos;
  int? price;
  int? iV;

  Product(
      {this.sId,
      this.company,
      this.title,
      this.description,
      this.category,
      this.photos,
      this.price,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    company = json['company'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
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
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}

class Prices {
  String? productId;
  String? lowerLimit;
  String? usergroupId;
  String? percentageDiscount;
  int? price;

  Prices({this.productId, this.lowerLimit, this.usergroupId, this.percentageDiscount, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    lowerLimit = json['lower_limit'];
    usergroupId = json['usergroup_id'];
    percentageDiscount = json['percentage_discount'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['lower_limit'] = this.lowerLimit;
    data['usergroup_id'] = this.usergroupId;
    data['percentage_discount'] = this.percentageDiscount;
    data['price'] = this.price;
    return data;
  }
}
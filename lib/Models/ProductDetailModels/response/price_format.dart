class PriceFormat {
  String? currencyId;
  String? currencyCode;
  String? after;
  String? symbol;
  String? coefficient;
  String? isPrimary;
  String? position;
  String? decimalsSeparator;
  String? thousandsSeparator;
  String? decimals;
  String? status;
  String? description;
  String? storefrontIds;

  PriceFormat({this.currencyId, this.currencyCode, this.after, this.symbol, this.coefficient, this.isPrimary, this.position, this.decimalsSeparator, this.thousandsSeparator, this.decimals, this.status, this.description, this.storefrontIds});

  PriceFormat.fromJson(Map<String, dynamic> json) {
    currencyId = json['currency_id'];
    currencyCode = json['currency_code'];
    after = json['after'];
    symbol = json['symbol'];
    coefficient = json['coefficient'];
    isPrimary = json['is_primary'];
    position = json['position'];
    decimalsSeparator = json['decimals_separator'];
    thousandsSeparator = json['thousands_separator'];
    decimals = json['decimals'];
    status = json['status'];
    description = json['description'];
    storefrontIds = json['storefront_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_id'] = this.currencyId;
    data['currency_code'] = this.currencyCode;
    data['after'] = this.after;
    data['symbol'] = this.symbol;
    data['coefficient'] = this.coefficient;
    data['is_primary'] = this.isPrimary;
    data['position'] = this.position;
    data['decimals_separator'] = this.decimalsSeparator;
    data['thousands_separator'] = this.thousandsSeparator;
    data['decimals'] = this.decimals;
    data['status'] = this.status;
    data['description'] = this.description;
    data['storefront_ids'] = this.storefrontIds;
    return data;
  }
}
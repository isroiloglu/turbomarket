class Discounts {
  int? a;
  int? p;

  Discounts({this.a, this.p});

  Discounts.fromJson(Map<String, dynamic> json) {
    a = json['A'];
    p = json['P'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['A'] = a;
    data['P'] = p;
    return data;
  }
}
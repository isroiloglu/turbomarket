
class Sorting {
  String? name;
  String? sortBy;
  String? sortOrder;

  Sorting({this.name, this.sortBy, this.sortOrder});

  Sorting.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sortBy = json['sort_by'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sort_by'] = this.sortBy;
    data['sort_order'] = this.sortOrder;
    return data;
  }



}

class SaveCustomerRequest {
  bool? newsletter;
  String? password;
  String? genderId;
  String? email;
  String? lastName;
  bool? option;
  String? firstName;
  DateTime? date;

  SaveCustomerRequest({
    this.newsletter,
    this.password,
    this.genderId,
    this.email,
    this.lastName,
    this.option,
    this.firstName,
    this.date,
  });

  Future<Map<String, dynamic>> toJson() async {
    var map = <String, dynamic>{
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "id_gender": genderId,
      "passwd": password,
      "active": "1"
    };
    if (newsletter == true) {
      map["newsletter"] = "1";
    }
    if (option == true) {
      map["optin"] = "1";
    }
    if (date != null) {
      map["years"] = date!.year;
      map["days"] = date!.day;
      map["months"] = date!.month;
    }
    // var cartId = (await AppSharedPref.getCartId());
    // if (cartId.isNotEmpty && cartId != "0") {
    //   map["id_cart"] = await AppSharedPref.getCartId();
    //   map["id_guest"] = await AppSharedPref.getGuestId();
    // }
    return map;
  }
}

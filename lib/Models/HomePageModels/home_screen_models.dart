
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/page.dart';

import 'active_currency.dart';
import 'active_language.dart';
import 'banners.dart';
import 'brands.dart';
import 'categories.dart';
import 'contactDetails.dart';
import 'homePromotions.dart';
import 'products.dart';
part 'home_screen_models.g.dart';




@JsonSerializable()
class HomeScreenModels{

  @JsonKey(name: "customer_image")
  String? customerImage;

  @JsonKey(name:"product_total")
  int? productTotal;

  @JsonKey(name: "theme_type")
  int? themeType;

  @JsonKey(name: "app_version")
  int? appVersion;

  @JsonKey(name: "default_language")
  String? defaultLanguage;

  @JsonKey(name: "default_currency")
  String? defaultCurrency;

  @JsonKey(name: "default_currency_symbol")
  String? defaultCurrencySymbol;

  @JsonKey(name: "active_languages",defaultValue: null)
  List<ActiveLanguages>? activeLanguageList;

  @JsonKey(name: "active_currencies")
  List<ActiveCurrency>? activeCurrencyList;

  @JsonKey(name: "company_id")
  String? companyId;

  @JsonKey(name: "categories")
  List<Categories>? categoryList;

  @JsonKey(name: "products")
  List<Products>? productList;

  @JsonKey(name: "brand")
  List<Brands>? brandList;


  @JsonKey(name: "pages")
  List<CMSPage>? pageList;

  @JsonKey(name: "banner")
  List<Banners>? bannerList;

  @JsonKey(name:"contactDetails")
  ContactDetails? contactDetails;

  @JsonKey(name:"promotions")
  List<Promotions>? promotionList;

  HomeScreenModels(
      this.customerImage,
      this.themeType,
      this.appVersion,
      this.defaultLanguage,
      this.defaultCurrency,
      this.defaultCurrencySymbol,
      this.activeLanguageList,
      this.activeCurrencyList,
      this.companyId,
      this.categoryList,
      this.productList,
      this.brandList,
      this.pageList,
      this.bannerList,this.contactDetails,this.promotionList, this.productTotal);

  factory HomeScreenModels.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenModelsFromJson(json);

  Map<String, dynamic> toJson() => _$HomeScreenModelsToJson(this);
}
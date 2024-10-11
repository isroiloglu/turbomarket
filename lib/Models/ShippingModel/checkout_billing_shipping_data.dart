import 'package:json_annotation/json_annotation.dart';

import 'country_list.dart';
import 'extras.dart';
part 'checkout_billing_shipping_data.g.dart';



@JsonSerializable()
class CheckoutBillingShippingData{
  @JsonKey(name:"user_id")
  String? userId;

  @JsonKey(name:"status")
  String? status;

  @JsonKey(name:"user_type")
  String? userType;

  @JsonKey(name:"user_login")
  String? userLogin;

  @JsonKey(name:"referer")
  String? referer;

  @JsonKey(name:"is_root")
  String? isRoot;

  @JsonKey(name:"company_id")
  String? companyId;

  @JsonKey(name:"last_login")
  String? lastLogin;

  @JsonKey(name:"last_activity")
  String? lastActivity;

  @JsonKey(name:"timestamp")
  String? timestamp;

  @JsonKey(name:"password")
  String? password;

  @JsonKey(name:"salt")
  String? salt;

  @JsonKey(name:"firstname")
  String? firstname;

  @JsonKey(name:"lastname")
  String? lastname;

  @JsonKey(name:"company")
  String? company;

  @JsonKey(name:"email")
  String? email;

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"fax")
  String? fax;

  @JsonKey(name:"url")
  String? url;

  @JsonKey(name:"tax_exempt")
  String? taxExempt;

  @JsonKey(name:"lang_code")
  String? langCode;

  @JsonKey(name:"birthday")
  String? birthday;

  @JsonKey(name:"purchase_timestamp_from")
  String? purchaseTimestampFrom;

  @JsonKey(name:"purchase_timestamp_to")
  String? purchaseTimestampTo;

  @JsonKey(name:"responsible_email")
  String? responsibleEmail;

  @JsonKey(name:"password_change_timestamp")
  String? passwordChangeTimestamp;

  @JsonKey(name:"api_key")
  String? apiKey;

  @JsonKey(name:"janrain_identifier")
  String? janrainIdentifier;

  @JsonKey(name:"applied_promotion")
  String? appliedPromotion;

  @JsonKey(name:"profile_id")
  String? profileId;

  @JsonKey(name:"profile_type")
  String? profileType;

  @JsonKey(name:"b_firstname")
  String? bFirstname;

  @JsonKey(name:"b_lastname")
  String? bLastname;

  @JsonKey(name:"b_address")
  String? bAddress;

  @JsonKey(name:"b_address_2")
  String? bAddress2;

  @JsonKey(name:"b_city")
  String? bCity;

  @JsonKey(name:"b_county")
  String? bCounty;

  @JsonKey(name:"b_state")
  String? bState;

  @JsonKey(name:"b_country")
  String? bCountry;

  @JsonKey(name:"b_zipcode")
  String? bZipcode;

  @JsonKey(name:"b_phone")
  String? bPhone;

  @JsonKey(name:"s_firstname")
  String? sFirstname;

  @JsonKey(name:"s_lastname")
  String? sLastname;

  @JsonKey(name:"s_address")
  String? sAddress;

  @JsonKey(name:"s_address_2")
  String? sAddress2;

  @JsonKey(name:"s_city")
  String? sCity;

  @JsonKey(name:"s_county")
  String? sCounty;

  @JsonKey(name:"s_state")
  String? sState;

  @JsonKey(name:"s_country")
  String? sCountry;

  @JsonKey(name:"s_zipcode")
  String? sZipcode;

  @JsonKey(name:"s_phone")
  String? sPhone;

  @JsonKey(name:"s_address_type")
  String? sAddressType;

  @JsonKey(name:"profile_name")
  String? profileName;

  @JsonKey(name:"profile_update_timestamp")
  String? profileUpdateTimestamp;

  @JsonKey(name:"b_country_descr")
  String? bCountryDescr;

  @JsonKey(name:"s_country_descr")
  String? sCountryDescr;

  @JsonKey(name:"b_state_descr")
  String? bStateDescr;

  @JsonKey(name:"s_state_descr")
  String? sStateDescr;
  //
  // @JsonKey(name:"points")
  // int? points;

  @JsonKey(name:"multiple_profile_enable")
  bool? multipleProfileEnable;

  @JsonKey(name:"country_list")
  List<CountryList>? countryList;

  @JsonKey(name:"extra")
  Extra? extra;





  CheckoutBillingShippingData(
      {this.userId,
        this.status,
        this.userType,
        this.userLogin,
        this.referer,
        this.isRoot,
        this.companyId,
        this.lastLogin,
        this.lastActivity,
        this.timestamp,
        this.password,
        this.salt,
        this.firstname,
        this.lastname,
        this.company,
        this.email,
        this.phone,
        this.fax,
        this.url,
        this.taxExempt,
        this.langCode,
        this.birthday,
        this.purchaseTimestampFrom,
        this.purchaseTimestampTo,
        this.responsibleEmail,
        this.passwordChangeTimestamp,
        this.apiKey,
        this.janrainIdentifier,
        this.appliedPromotion,
        this.profileId,
        this.profileType,
        this.bFirstname,
        this.bLastname,
        this.bAddress,
        this.bAddress2,
        this.bCity,
        this.bCounty,
        this.bState,
        this.bCountry,
        this.bZipcode,
        this.bPhone,
        this.sFirstname,
        this.sLastname,
        this.sAddress,
        this.sAddress2,
        this.sCity,
        this.sCounty,
        this.sState,
        this.sCountry,
        this.sZipcode,
        this.sPhone,
        this.sAddressType,
        this.profileName,
        this.profileUpdateTimestamp,
        this.bCountryDescr,
        this.sCountryDescr,
        this.bStateDescr,
        this.sStateDescr,
        this.multipleProfileEnable,
        this.countryList,
        this.extra});

  String getFormattedAddress(){
    if(firstname == null || checkNull(firstname)=="" || bAddress == null || checkNull(bAddress)==""){
      return "No Address Found";
    }

    return checkNull(bFirstname) +" "+ checkNull(bLastname)+"\n"+checkNull(bPhone)+"\n"+checkNull(bAddress)+"\n"+checkNull(bCity)+"\n"+checkNull(bStateDescr)+"\n"+checkNull(bCountryDescr);
  }

  String getFormattedShippingAddress(){
    if(firstname == null || checkNull(firstname)=="" || sAddress == null || checkNull(sAddress)==""){
      return "No Address Found";
    }

    return checkNull(sFirstname) +" "+ checkNull(sLastname)+"\n"+checkNull(sPhone)+"\n"+checkNull(sAddress)+"\n"+checkNull(sCity)+"\n"+checkNull(sStateDescr)+"\n"+checkNull(sCountryDescr);

  }
  @JsonKey(ignore: true)
  bool haveAddress=false;

  String getShippingAddressForCheckout(){
    if(sFirstname == null || checkNull(sFirstname)=="" || sAddress == null){
      haveAddress=true;
      return "No Address Found";
    }

    return checkNull(sFirstname) +" "+ checkNull(sLastname)+"\n"+checkNull(sPhone)+"\n"+checkNull(sAddress)+"\n"+checkNull(sCity)+"\n"+checkNull(sStateDescr)+"\n"+checkNull(sCountryDescr);

  }

  String checkNull(String? values){
    if(values==null) {
      return "";
    } else{
      return values.toString();
    }
  }


  @override
  String toString() {
    return 'CheckoutBillingShippingData{userId: $userId, status: $status, userType: $userType, userLogin: $userLogin, referer: $referer, isRoot: $isRoot, companyId: $companyId, lastLogin: $lastLogin, lastActivity: $lastActivity, timestamp: $timestamp, password: $password, salt: $salt, firstname: $firstname, lastname: $lastname, company: $company, email: $email, phone: $phone, fax: $fax, url: $url, taxExempt: $taxExempt, langCode: $langCode, birthday: $birthday, purchaseTimestampFrom: $purchaseTimestampFrom, purchaseTimestampTo: $purchaseTimestampTo, responsibleEmail: $responsibleEmail, passwordChangeTimestamp: $passwordChangeTimestamp, apiKey: $apiKey, janrainIdentifier: $janrainIdentifier, appliedPromotion: $appliedPromotion, profileId: $profileId, profileType: $profileType, bFirstname: $bFirstname, bLastname: $bLastname, bAddress: $bAddress, bAddress2: $bAddress2, bCity: $bCity, bCounty: $bCounty, bState: $bState, bCountry: $bCountry, bZipcode: $bZipcode, bPhone: $bPhone, sFirstname: $sFirstname, sLastname: $sLastname, sAddress: $sAddress, sAddress2: $sAddress2, sCity: $sCity, sCounty: $sCounty, sState: $sState, sCountry: $sCountry, sZipcode: $sZipcode, sPhone: $sPhone, sAddressType: $sAddressType, profileName: $profileName, profileUpdateTimestamp: $profileUpdateTimestamp, bCountryDescr: $bCountryDescr, sCountryDescr: $sCountryDescr, bStateDescr: $bStateDescr, sStateDescr: $sStateDescr, multipleProfileEnable: $multipleProfileEnable, countryList: $countryList, extra: $extra}';
  }

  factory CheckoutBillingShippingData.fromJson(Map<String, dynamic> json) =>
      _$CheckoutBillingShippingDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutBillingShippingDataToJson(this);

}
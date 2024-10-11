
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/variant.dart';
part 'product_option.g.dart';


@JsonSerializable()
class ProductOption {
  @JsonKey(name:"option_id")
  int? optionId;


  @JsonKey(name:"product_id")

  dynamic productId;
  @JsonKey(name:"company_id")

  dynamic companyId;
  @JsonKey(name:"option_type")
  
   String? optionType;
  @JsonKey(name:"inventory")

  dynamic inventory;
  @JsonKey(name:"regexp")
  
   String? regexp;
  @JsonKey(name:"required")
  
   String? required;
  @JsonKey(name:"multiupload")

  dynamic multiupload;
  @JsonKey(name:"allowed_extensions")

  dynamic allowedExtensions;
  @JsonKey(name:"max_file_size")

  dynamic maxFileSize;
  @JsonKey(name:"missing_variants_handling")

  dynamic missingVariantsHandling;
  @JsonKey(name:"status")

  dynamic status;
  @JsonKey(name:"position")

  dynamic position;
  @JsonKey(name:"value")

  dynamic value;
  @JsonKey(name:"option_name")
  
   String? optionName;
  @JsonKey(name:"option_text")
  
   String? optionText;
  @JsonKey(name:"description")
  
   String? description;
  @JsonKey(name:"inner_hint")
  
   String? innerHint;
  @JsonKey(name:"incorrect_message")
  
   String? incorrectMessage;
  @JsonKey(name:"comment")
  
   String? comment;
  @JsonKey(name:"variants")
  
   List<Variant>? variants;

  @JsonKey(name:"configured")
  
   bool? isConfigured;

  ProductOption({
     this.optionId,
     this.productId,
     this.companyId,
     this.optionType,
     this.inventory,
     this.regexp,
     this.required,
     this.multiupload,
     this.allowedExtensions,
     this.maxFileSize,
     this.missingVariantsHandling,
     this.status,
     this.position,
     this.value,
     this.optionName,
     this.optionText,
     this.description,
     this.innerHint,
     this.incorrectMessage,
     this.comment,
     this.variants,
     this.isConfigured,
  });


  @override
  String toString() {
    return 'ProductOption{variants: $variants}';
  }

  factory ProductOption.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionFromJson(json);

  Map<String?, dynamic> toJson() => _$ProductOptionToJson(this);
}
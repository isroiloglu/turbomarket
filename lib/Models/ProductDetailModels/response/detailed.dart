import 'package:json_annotation/json_annotation.dart';
part 'detailed.g.dart';

@JsonSerializable()
class Detailed{
  @JsonKey(name:"object_id")
  
   String? objectId;
  @JsonKey(name:"object_type")
  
   String? objectType;
  @JsonKey(name:"type")
  
   String? type;
  @JsonKey(name:"image_path")
  
   String? imagePath;
  @JsonKey(name:"alt")
  
   String? alt;
  @JsonKey(name:"image_x")
  
   String? imageX;
  @JsonKey(name:"image_y")
  
   String? imageY;
  @JsonKey(name:"http_image_path")
  
   String? httpImagePath;
  @JsonKey(name:"https_image_path")
  
   String? httpsImagePath;
  @JsonKey(name:"absolute_path")
  
   String? absolutePath;
  @JsonKey(name:"relative_path")
  
   String? relativePath;
  @JsonKey(name:"is_high_res")
  
   bool? isHighRes;

  Detailed({
     this.objectId,
     this.objectType,
     this.type,
     this.imagePath,
     this.alt,
     this.imageX,
     this.imageY,
     this.httpImagePath,
     this.httpsImagePath,
     this.absolutePath,
     this.relativePath,
     this.isHighRes,
  });

  factory Detailed.fromJson(Map<String, dynamic> json) =>
      _$DetailedFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedToJson(this);
}
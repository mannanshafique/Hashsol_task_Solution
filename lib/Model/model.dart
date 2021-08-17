
import 'dart:convert';
import 'package:hive/hive.dart';
part 'model.g.dart'; 

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.data,
    this.code,
    this.message,
    this.imageUrl,
  });

  List<Datum>? data;
  int? code;
  String? message;
  String? imageUrl;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
        message: json["message"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "code": code,
        "message": message,
        "image_url": imageUrl,
      };
}
@HiveType(typeId: 0)
class Datum {
  Datum({
    this.id,
    this.unitId,
    this.code,
    this.name,
    this.featuredImage,
    this.price,
    this.weight,
    this.description,
    this.isFeatured,
    this.customizeBox,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

@HiveField(0)    
  int? id;
  @HiveField(1) 
  dynamic unitId;
  @HiveField(2) 
  String? code;
  @HiveField(3) 
  String? name;
  @HiveField(4) 
  dynamic featuredImage;
  @HiveField(5) 
  String? price;
  @HiveField(6) 
  dynamic weight;
  @HiveField(7) 
  dynamic description;
  @HiveField(8) 
  int? isFeatured;
  @HiveField(9) 
  int? customizeBox;
  @HiveField(10) 
  int? status;
  @HiveField(11) 
  int? createdBy;
  @HiveField(12) 
  int? updatedBy;
  @HiveField(13) 
  dynamic deletedAt;
  @HiveField(14) 
  DateTime? createdAt;
  @HiveField(15) 
  DateTime? updatedAt;
  @HiveField(16) 

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        unitId: json["unit_id"],
        code: json["code"],
        name: json["name"],
        featuredImage: json["featured_image"],
        price: json["price"],
        weight: json["weight"],
        description: json["description"],
        isFeatured: json["is_featured"],
        customizeBox: json["customize_box"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unit_id": unitId,
        "code": code,
        "name": name,
        "featured_image": featuredImage,
        "price": price,
        "weight": weight,
        "description": description,
        "is_featured": isFeatured,
        "customize_box": customizeBox,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}



   //! For hive Adapter 


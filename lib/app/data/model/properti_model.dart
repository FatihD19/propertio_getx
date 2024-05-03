import 'package:propertio_getx/app/data/model/agent_model.dart';

class PropertyType {
  String? name;
  String? icon;

  PropertyType({
    this.name,
    this.icon,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
      };
}

class Address {
  String? address;
  String? district;
  String? city;
  String? province;
  String? postalCode;
  String? latitude;
  String? longitude;

  Address({
    this.address,
    this.district,
    this.city,
    this.province,
    this.postalCode,
    this.latitude,
    this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        district: json["district"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postal_code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "district": district,
        "city": city,
        "province": province,
        "postal_code": postalCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}

// class Developer {
//   String? fullName;
//   String? pictureProfileFile;

//   Developer({
//     this.fullName,
//     this.pictureProfileFile,
//   });

//   factory Developer.fromJson(Map<String, dynamic> json) => Developer(
//         fullName: json["full_name"],
//         pictureProfileFile: json["picture_profile_file"],
//       );

//   Map<String, dynamic> toJson() => {
//         "full_name": fullName,
//         "picture_profile_file": pictureProfileFile,
//       };
// }

class PropertiModel {
  String? propertyCode;
  String? title;
  String? headline;
  String? slug;
  PropertyType? propertyType;
  String? listingType;
  DateTime? postedAt;
  String? price;
  String? photo;
  Address? address;
  String? certificate;
  int? countViews;
  int? countLeads;
  String? status;
  String? bedroom;
  String? bathroom;
  bool? isFavorites;
  String? area;
  AgentModel? agent;
  List<PropertyPhoto>? propertyPhoto;

  PropertiModel({
    this.propertyCode,
    this.title,
    this.headline,
    this.slug,
    this.propertyType,
    this.listingType,
    this.postedAt,
    this.price,
    this.photo,
    this.address,
    this.certificate,
    this.countViews,
    this.countLeads,
    this.status,
    this.bedroom,
    this.bathroom,
    this.isFavorites,
    this.area,
    this.agent,
    this.propertyPhoto,
  });

  factory PropertiModel.fromJson(Map<String, dynamic> json) => PropertiModel(
        propertyCode: json["property_code"],
        title: json["title"],
        headline: json["headline"],
        slug: json["slug"],
        propertyType: json["property_type"] == null
            ? null
            : PropertyType.fromJson(json["property_type"]),
        listingType: json["listing_type"],
        postedAt: json["posted_at"] == null
            ? null
            : DateTime.parse(json["posted_at"]),
        price: json["price"],
        photo: json["photo"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        certificate: json["certificate"],
        countViews: json["count_views"],
        countLeads: json["count_leads"],
        status: json["status"],
        bedroom: json["bedroom"],
        bathroom: json["bathroom"],
        isFavorites: json["is_favorites"],
        area: json["area"],
        agent:
            json["agent"] == null ? null : AgentModel.fromJson(json["agent"]),
        propertyPhoto: json["property_photo"] == null
            ? []
            : List<PropertyPhoto>.from(
                json["property_photo"]!.map((x) => PropertyPhoto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "property_code": propertyCode,
        "title": title,
        "headline": headline,
        "slug": slug,
        "property_type": propertyType?.toJson(),
        "listing_type": listingType,
        "posted_at": postedAt?.toIso8601String(),
        "price": price,
        "photo": photo,
        "address": address?.toJson(),
        "certificate": certificate,
        "count_views": countViews,
        "count_leads": countLeads,
        "status": status,
        "bedroom": bedroom,
        "bathroom": bathroom,
        "is_favorites": isFavorites,
        "area": area,
        "agent": agent?.toJson(),
        "property_photo": propertyPhoto == null
            ? []
            : List<dynamic>.from(propertyPhoto!.map((x) => x.toJson())),
      };
}

class PropertyPhoto {
  String? caption;
  String? filename;
  String? isCover;

  PropertyPhoto({
    this.caption,
    this.filename,
    this.isCover,
  });

  factory PropertyPhoto.fromJson(Map<String, dynamic> json) => PropertyPhoto(
        caption: json["caption"],
        filename: json["filename"],
        isCover: json["is_cover"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "filename": filename,
        "is_cover": isCover,
      };
}

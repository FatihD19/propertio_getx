import 'package:propertio_getx/app/data/model/agent_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';

class DetailPropertiResponseModel {
  String? status;
  String? message;
  DetailPropertiModel? data;

  DetailPropertiResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailPropertiResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailPropertiResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DetailPropertiModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DetailPropertiModel {
  String? listingClass;
  String? propertyCode;
  String? listingType;
  String? title;
  String? headline;
  String? province;
  String? city;
  String? district;
  String? address;
  String? postalCode;
  String? longitude;
  String? latitude;
  String? certificate;
  String? description;
  String? status;
  String? slug;
  DateTime? postedAt;
  bool? isFavorites;
  int? views;
  PropertyType? propertyType;
  AgentModel? agent;
  PropertyDetail? propertyDetail;
  List<PropertyFacility>? propertyFacility;
  List<PropertyPhoto>? propertyPhoto;
  List<dynamic>? propertyDocuments;
  PropertyVideo? propertyVideo;
  PropertyVirtualTour? propertyVirtualTour;

  DetailPropertiModel({
    this.listingClass,
    this.propertyCode,
    this.listingType,
    this.title,
    this.headline,
    this.province,
    this.city,
    this.district,
    this.address,
    this.postalCode,
    this.longitude,
    this.latitude,
    this.certificate,
    this.description,
    this.status,
    this.slug,
    this.postedAt,
    this.isFavorites,
    this.views,
    this.propertyType,
    this.agent,
    this.propertyDetail,
    this.propertyFacility,
    this.propertyPhoto,
    this.propertyDocuments,
    this.propertyVideo,
    this.propertyVirtualTour,
  });

  factory DetailPropertiModel.fromJson(Map<String, dynamic> json) =>
      DetailPropertiModel(
        listingClass: json["listing_class"],
        propertyCode: json["property_code"],
        listingType: json["listing_type"],
        title: json["title"],
        headline: json["headline"],
        province: json["province"],
        city: json["city"],
        district: json["district"],
        address: json["address"],
        postalCode: json["postal_code"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        certificate: json["certificate"],
        description: json["description"],
        status: json["status"],
        slug: json["slug"],
        postedAt: json["posted_at"] == null
            ? null
            : DateTime.parse(json["posted_at"]),
        isFavorites: json["is_favorites"],
        views: json["views"],
        propertyType: json["property_type"] == null
            ? null
            : PropertyType.fromJson(json["property_type"]),
        agent:
            json["agent"] == null ? null : AgentModel.fromJson(json["agent"]),
        propertyDetail: json["property_detail"] == null
            ? null
            : PropertyDetail.fromJson(json["property_detail"]),
        propertyFacility: json["property_facility"] == null
            ? []
            : List<PropertyFacility>.from(json["property_facility"]!
                .map((x) => PropertyFacility.fromJson(x))),
        propertyPhoto: json["property_photo"] == null
            ? []
            : List<PropertyPhoto>.from(
                json["property_photo"]!.map((x) => PropertyPhoto.fromJson(x))),
        propertyDocuments: json["property_documents"] == null
            ? []
            : List<dynamic>.from(json["property_documents"]!.map((x) => x)),
        propertyVideo: json["property_video"] == null
            ? null
            : PropertyVideo.fromJson(json["property_video"]),
        propertyVirtualTour: json["property_virtual_tour"] == null
            ? null
            : PropertyVirtualTour.fromJson(json["property_virtual_tour"]),
      );

  Map<String, dynamic> toJson() => {
        "listing_class": listingClass,
        "property_code": propertyCode,
        "listing_type": listingType,
        "title": title,
        "headline": headline,
        "province": province,
        "city": city,
        "district": district,
        "address": address,
        "postal_code": postalCode,
        "longitude": longitude,
        "latitude": latitude,
        "certificate": certificate,
        "description": description,
        "status": status,
        "slug": slug,
        "posted_at": postedAt?.toIso8601String(),
        "is_favorites": isFavorites,
        "views": views,
        "property_type": propertyType?.toJson(),
        "agent": agent?.toJson(),
        "property_detail": propertyDetail?.toJson(),
        "property_facility": propertyFacility == null
            ? []
            : List<dynamic>.from(propertyFacility!.map((x) => x.toJson())),
        "property_photo": propertyPhoto == null
            ? []
            : List<dynamic>.from(propertyPhoto!.map((x) => x.toJson())),
        "property_documents": propertyDocuments == null
            ? []
            : List<dynamic>.from(propertyDocuments!.map((x) => x)),
        "property_video": propertyVideo?.toJson(),
        "property_virtual_tour": propertyVirtualTour?.toJson(),
      };
}

class PropertyDetail {
  String? description;
  String? surfaceArea;
  String? buildingArea;
  String? floor;
  String? bedroom;
  String? bathroom;
  String? garage;
  String? yearBuilt;
  String? position;
  String? price;
  String? priceType;
  String? powerSupply;
  String? condition;
  String? waterType;
  String? interior;
  String? facing;
  String? roadAccess;
  dynamic quantity;

  PropertyDetail({
    this.description,
    this.surfaceArea,
    this.buildingArea,
    this.floor,
    this.bedroom,
    this.bathroom,
    this.garage,
    this.yearBuilt,
    this.position,
    this.price,
    this.priceType,
    this.powerSupply,
    this.condition,
    this.waterType,
    this.interior,
    this.facing,
    this.roadAccess,
    this.quantity,
  });

  factory PropertyDetail.fromJson(Map<String, dynamic> json) => PropertyDetail(
        description: json["description"],
        surfaceArea: json["surface_area"],
        buildingArea: json["building_area"],
        floor: json["floor"],
        bedroom: json["bedroom"],
        bathroom: json["bathroom"],
        garage: json["garage"],
        yearBuilt: json["year_built"],
        position: json["position"],
        price: json["price"],
        priceType: json["price_type"],
        powerSupply: json["power_supply"],
        condition: json["condition"],
        waterType: json["water_type"],
        interior: json["interior"],
        facing: json["facing"],
        roadAccess: json["road_access"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "surface_area": surfaceArea,
        "building_area": buildingArea,
        "floor": floor,
        "bedroom": bedroom,
        "bathroom": bathroom,
        "garage": garage,
        "year_built": yearBuilt,
        "position": position,
        "price": price,
        "price_type": priceType,
        "power_supply": powerSupply,
        "condition": condition,
        "water_type": waterType,
        "interior": interior,
        "facing": facing,
        "road_access": roadAccess,
        "quantity": quantity,
      };
}

class PropertyFacility {
  String? name;
  String? category;
  String? icon;

  PropertyFacility({
    this.name,
    this.category,
    this.icon,
  });

  factory PropertyFacility.fromJson(Map<String, dynamic> json) =>
      PropertyFacility(
        name: json["name"],
        category: json["category"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "icon": icon,
      };
}

class PropertyVideo {
  String? vendor;
  String? link;
  dynamic thumbnail;

  PropertyVideo({
    this.vendor,
    this.link,
    this.thumbnail,
  });

  factory PropertyVideo.fromJson(Map<String, dynamic> json) => PropertyVideo(
        vendor: json["vendor"],
        link: json["link"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "vendor": vendor,
        "link": link,
        "thumbnail": thumbnail,
      };
}

class PropertyVirtualTour {
  String? name;
  String? link;

  PropertyVirtualTour({
    this.name,
    this.link,
  });

  factory PropertyVirtualTour.fromJson(Map<String, dynamic> json) =>
      PropertyVirtualTour(
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
      };
}

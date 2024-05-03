import 'package:propertio_getx/app/data/model/developer_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';
import 'package:propertio_getx/app/data/model/responses/detail_project_response_model.dart';

class DetailunitResponseModel {
  String? status;
  String? message;
  DetailUnitModel? data;

  DetailunitResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailunitResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailunitResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DetailUnitModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DetailUnitModel {
  String? unitCode;
  String? title;
  String? description;
  String? surfaceArea;
  String? buildingArea;
  String? order;
  String? stock;
  String? floor;
  String? bedroom;
  String? bathroom;
  String? garage;
  String? price;
  String? powerSupply;
  String? waterType;
  String? interior;
  String? roadAccess;
  String? certificate;
  String? projectTitle;
  int? countViews;
  DateTime? postedAt;
  bool? isFavorites;
  Address? address;
  String? projectCode;
  String? immersiveApps;
  DeveloperModel? developer;
  PropertyType? propertyType;
  List<UnitPhoto>? unitPhotos;
  UnitVideo? unitVideo;
  UnitVirtualTour? unitVirtualTour;
  UnitUrl? unitModel;
  List<UnitDocument>? unitDocuments;
  List<ProjectFacility>? projectFacilities;
  List<ProjectInfrastructure>? projectInfrastructure;

  DetailUnitModel({
    this.unitCode,
    this.title,
    this.description,
    this.surfaceArea,
    this.buildingArea,
    this.order,
    this.stock,
    this.floor,
    this.bedroom,
    this.bathroom,
    this.garage,
    this.price,
    this.powerSupply,
    this.waterType,
    this.interior,
    this.roadAccess,
    this.certificate,
    this.projectTitle,
    this.countViews,
    this.postedAt,
    this.isFavorites,
    this.address,
    this.projectCode,
    this.immersiveApps,
    this.developer,
    this.propertyType,
    this.unitPhotos,
    this.unitVideo,
    this.unitVirtualTour,
    this.unitModel,
    this.unitDocuments,
    this.projectFacilities,
    this.projectInfrastructure,
  });

  factory DetailUnitModel.fromJson(Map<String, dynamic> json) =>
      DetailUnitModel(
        unitCode: json["unit_code"],
        title: json["title"],
        description: json["description"],
        surfaceArea: json["surface_area"],
        buildingArea: json["building_area"],
        order: json["order"],
        stock: json["stock"],
        floor: json["floor"],
        bedroom: json["bedroom"],
        bathroom: json["bathroom"],
        garage: json["garage"],
        price: json["price"],
        powerSupply: json["power_supply"],
        waterType: json["water_type"],
        interior: json["interior"],
        roadAccess: json["road_access"],
        certificate: json["certificate"],
        projectTitle: json["project_title"],
        countViews: json["count_views"],
        postedAt: json["posted_at"] == null
            ? null
            : DateTime.parse(json["posted_at"]),
        isFavorites: json["is_favorites"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        projectCode: json["project_code"],
        immersiveApps: json["immersive_apps"],
        developer: json["developer"] == null
            ? null
            : DeveloperModel.fromJson(json["developer"]),
        propertyType: json["property_type"] == null
            ? null
            : PropertyType.fromJson(json["property_type"]),
        unitPhotos: json["unit_photos"] == null
            ? []
            : List<UnitPhoto>.from(
                json["unit_photos"]!.map((x) => UnitPhoto.fromJson(x))),
        unitVideo: json["unit_video"] == null
            ? null
            : UnitVideo.fromJson(json["unit_video"]),
        unitVirtualTour: json["unit_virtual_tour"] == null
            ? null
            : UnitVirtualTour.fromJson(json["unit_virtual_tour"]),
        unitModel: json["unit_model"] == null
            ? null
            : UnitUrl.fromJson(json["unit_model"]),
        unitDocuments: json["unit_documents"] == null
            ? []
            : List<UnitDocument>.from(
                json["unit_documents"]!.map((x) => UnitDocument.fromJson(x))),
        projectFacilities: json["project_facilities"] == null
            ? []
            : List<ProjectFacility>.from(json["project_facilities"]!
                .map((x) => ProjectFacility.fromJson(x))),
        projectInfrastructure: json["project_infrastructure"] == null
            ? []
            : List<ProjectInfrastructure>.from(json["project_infrastructure"]!
                .map((x) => ProjectInfrastructure.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "unit_code": unitCode,
        "title": title,
        "description": description,
        "surface_area": surfaceArea,
        "building_area": buildingArea,
        "order": order,
        "stock": stock,
        "floor": floor,
        "bedroom": bedroom,
        "bathroom": bathroom,
        "garage": garage,
        "price": price,
        "power_supply": powerSupply,
        "water_type": waterType,
        "interior": interior,
        "road_access": roadAccess,
        "certificate": certificate,
        "project_title": projectTitle,
        "count_views": countViews,
        "posted_at": postedAt?.toIso8601String(),
        "is_favorites": isFavorites,
        "address": address?.toJson(),
        "project_code": projectCode,
        "immersive_apps": immersiveApps,
        "developer": developer?.toJson(),
        "property_type": propertyType?.toJson(),
        "unit_photos": unitPhotos == null
            ? []
            : List<dynamic>.from(unitPhotos!.map((x) => x.toJson())),
        "unit_video": unitVideo?.toJson(),
        "unit_virtual_tour": unitVirtualTour?.toJson(),
        "unit_model": unitModel?.toJson(),
        "unit_documents": unitDocuments == null
            ? []
            : List<dynamic>.from(unitDocuments!.map((x) => x.toJson())),
        "project_facilities": projectFacilities == null
            ? []
            : List<dynamic>.from(projectFacilities!.map((x) => x.toJson())),
        "project_infrastructure": projectInfrastructure == null
            ? []
            : List<dynamic>.from(projectInfrastructure!.map((x) => x.toJson())),
      };
}

class UnitDocument {
  String? name;
  String? type;
  String? filename;

  UnitDocument({
    this.name,
    this.type,
    this.filename,
  });

  factory UnitDocument.fromJson(Map<String, dynamic> json) => UnitDocument(
        name: json["name"],
        type: json["type"],
        filename: json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "filename": filename,
      };
}

class UnitUrl {
  String? link;

  UnitUrl({
    this.link,
  });

  factory UnitUrl.fromJson(Map<String, dynamic> json) => UnitUrl(
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
      };
}

class UnitPhoto {
  String? caption;
  String? filename;
  String? isCover;
  String? type;

  UnitPhoto({
    this.caption,
    this.filename,
    this.isCover,
    this.type,
  });

  factory UnitPhoto.fromJson(Map<String, dynamic> json) => UnitPhoto(
        caption: json["caption"],
        filename: json["filename"],
        isCover: json["is_cover"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "filename": filename,
        "is_cover": isCover,
        "type": type,
      };
}

class UnitVideo {
  String? vendor;
  String? link;
  dynamic thumbnail;

  UnitVideo({
    this.vendor,
    this.link,
    this.thumbnail,
  });

  factory UnitVideo.fromJson(Map<String, dynamic> json) => UnitVideo(
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

class UnitVirtualTour {
  String? name;
  String? link;

  UnitVirtualTour({
    this.name,
    this.link,
  });

  factory UnitVirtualTour.fromJson(Map<String, dynamic> json) =>
      UnitVirtualTour(
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
      };
}

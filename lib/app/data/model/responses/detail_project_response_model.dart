import 'package:propertio_getx/app/data/model/developer_model.dart';
import 'package:propertio_getx/app/data/model/pagination_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';
import 'package:propertio_getx/app/data/model/unit_model.dart';

class DetailProjectResponseModel {
  String? status;
  String? message;
  DetailProjectModel? data;

  DetailProjectResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailProjectResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DetailProjectModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DetailProjectModel {
  int? id;
  String? title;
  String? headline;
  Address? address;
  PropertyType? propertyType;
  String? description;
  String? certificate;
  String? completedAt;
  DateTime? postedAt;
  int? countViews;
  String? projectCode;
  String? status;
  bool? isFavorites;
  String? siteplanImage;
  String? immersiveSiteplan;
  String? immersiveApps;
  int? unitType;
  int? unitStock;
  Units? units;
  DeveloperModel? developer;
  List<ProjectPhoto>? projectPhotos;
  ProjectVideo? projectVideo;
  ProjectVirtualTour? projectVirtualTour;
  List<ProjectDocument>? projectDocuments;
  List<ProjectFacility>? projectFacilities;
  List<ProjectInfrastructure>? projectInfrastructure;

  DetailProjectModel({
    this.id,
    this.title,
    this.headline,
    this.address,
    this.propertyType,
    this.description,
    this.certificate,
    this.completedAt,
    this.postedAt,
    this.countViews,
    this.projectCode,
    this.status,
    this.isFavorites,
    this.siteplanImage,
    this.immersiveSiteplan,
    this.immersiveApps,
    this.unitType,
    this.unitStock,
    this.units,
    this.developer,
    this.projectPhotos,
    this.projectVideo,
    this.projectVirtualTour,
    this.projectDocuments,
    this.projectFacilities,
    this.projectInfrastructure,
  });

  factory DetailProjectModel.fromJson(Map<String, dynamic> json) =>
      DetailProjectModel(
        id: json["id"],
        title: json["title"],
        headline: json["headline"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        propertyType: json["property_type"] == null
            ? null
            : PropertyType.fromJson(json["property_type"]),
        description: json["description"],
        certificate: json["certificate"],
        completedAt: json["completed_at"],
        postedAt: json["posted_at"] == null
            ? null
            : DateTime.parse(json["posted_at"]),
        countViews: json["count_views"],
        projectCode: json["project_code"],
        status: json["status"],
        isFavorites: json["is_favorites"],
        siteplanImage: json["siteplan_image"],
        immersiveSiteplan: json["immersive_siteplan"],
        immersiveApps: json["immersive_apps"],
        unitType: json["unit_type"],
        unitStock: json["unit_stock"],
        units: json["units"] == null ? null : Units.fromJson(json["units"]),
        developer: json["developer"] == null
            ? null
            : DeveloperModel.fromJson(json["developer"]),
        projectPhotos: json["project_photos"] == null
            ? []
            : List<ProjectPhoto>.from(
                json["project_photos"]!.map((x) => ProjectPhoto.fromJson(x))),
        projectVideo: json["project_video"] == null
            ? null
            : ProjectVideo.fromJson(json["project_video"]),
        projectVirtualTour: json["project_virtual_tour"] == null
            ? null
            : ProjectVirtualTour.fromJson(json["project_virtual_tour"]),
        projectDocuments: json["project_documents"] == null
            ? []
            : List<ProjectDocument>.from(json["project_documents"]!
                .map((x) => ProjectDocument.fromJson(x))),
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
        "id": id,
        "title": title,
        "headline": headline,
        "address": address?.toJson(),
        "property_type": propertyType?.toJson(),
        "description": description,
        "certificate": certificate,
        "completed_at": completedAt,
        "posted_at": postedAt?.toIso8601String(),
        "count_views": countViews,
        "project_code": projectCode,
        "status": status,
        "is_favorites": isFavorites,
        "siteplan_image": siteplanImage,
        "immersive_siteplan": immersiveSiteplan,
        "immersive_apps": immersiveApps,
        "unit_type": unitType,
        "unit_stock": unitStock,
        "units": units?.toJson(),
        "developer": developer?.toJson(),
        "project_photos": projectPhotos == null
            ? []
            : List<dynamic>.from(projectPhotos!.map((x) => x.toJson())),
        "project_video": projectVideo?.toJson(),
        "project_virtual_tour": projectVirtualTour?.toJson(),
        "project_documents": projectDocuments == null
            ? []
            : List<dynamic>.from(projectDocuments!.map((x) => x.toJson())),
        "project_facilities": projectFacilities == null
            ? []
            : List<dynamic>.from(projectFacilities!.map((x) => x.toJson())),
        "project_infrastructure": projectInfrastructure == null
            ? []
            : List<dynamic>.from(projectInfrastructure!.map((x) => x.toJson())),
      };
}

class ProjectDocument {
  String? name;
  String? type;
  String? filename;

  ProjectDocument({
    this.name,
    this.type,
    this.filename,
  });

  factory ProjectDocument.fromJson(Map<String, dynamic> json) =>
      ProjectDocument(
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

class ProjectFacility {
  String? name;
  String? category;
  String? icon;

  ProjectFacility({
    this.name,
    this.category,
    this.icon,
  });

  factory ProjectFacility.fromJson(Map<String, dynamic> json) =>
      ProjectFacility(
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

class ProjectInfrastructure {
  String? type;
  String? name;
  dynamic distance;

  ProjectInfrastructure({
    this.type,
    this.name,
    this.distance,
  });

  factory ProjectInfrastructure.fromJson(Map<String, dynamic> json) =>
      ProjectInfrastructure(
        type: json["type"],
        name: json["name"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "distance": distance,
      };
}

class ProjectPhoto {
  String? caption;
  String? filename;
  String? isCover;

  ProjectPhoto({
    this.caption,
    this.filename,
    this.isCover,
  });

  factory ProjectPhoto.fromJson(Map<String, dynamic> json) => ProjectPhoto(
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

class ProjectVideo {
  String? vendor;
  String? link;
  dynamic thumbnail;

  ProjectVideo({
    this.vendor,
    this.link,
    this.thumbnail,
  });

  factory ProjectVideo.fromJson(Map<String, dynamic> json) => ProjectVideo(
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

class ProjectVirtualTour {
  String? name;
  String? link;

  ProjectVirtualTour({
    this.name,
    this.link,
  });

  factory ProjectVirtualTour.fromJson(Map<String, dynamic> json) =>
      ProjectVirtualTour(
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
      };
}

class Units {
  List<UnitModel>? data;
  Pagination? pagination;

  Units({
    this.data,
    this.pagination,
  });

  factory Units.fromJson(Map<String, dynamic> json) => Units(
        data: json["data"] == null
            ? []
            : List<UnitModel>.from(
                json["data"]!.map((x) => UnitModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

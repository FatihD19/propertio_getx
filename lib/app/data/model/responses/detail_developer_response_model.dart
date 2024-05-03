import 'package:propertio_getx/app/data/model/pagination_model.dart';
import 'package:propertio_getx/app/data/model/proyek_model.dart';

class DetailDeveloperResponseModel {
  String? status;
  String? message;
  DetailDeveloper? data;

  DetailDeveloperResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailDeveloperResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailDeveloperResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DetailDeveloper.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DetailDeveloper {
  String? accountId;
  String? email;
  String? fullName;
  String? phone;
  String? pictureProfileFile;
  dynamic imageCover;
  String? address;
  String? city;
  String? province;
  String? description;
  String? website;
  dynamic areaSpecialist;
  ListProjects? projects;

  DetailDeveloper({
    this.accountId,
    this.email,
    this.fullName,
    this.phone,
    this.pictureProfileFile,
    this.imageCover,
    this.address,
    this.city,
    this.province,
    this.description,
    this.website,
    this.areaSpecialist,
    this.projects,
  });

  factory DetailDeveloper.fromJson(Map<String, dynamic> json) =>
      DetailDeveloper(
        accountId: json["account_id"],
        email: json["email"],
        fullName: json["full_name"],
        phone: json["phone"],
        pictureProfileFile: json["picture_profile_file"],
        imageCover: json["image_cover"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        description: json["description"],
        website: json["website"],
        areaSpecialist: json["area_specialist"],
        projects: json["projects"] == null
            ? null
            : ListProjects.fromJson(json["projects"]),
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "email": email,
        "full_name": fullName,
        "phone": phone,
        "picture_profile_file": pictureProfileFile,
        "image_cover": imageCover,
        "address": address,
        "city": city,
        "province": province,
        "description": description,
        "website": website,
        "area_specialist": areaSpecialist,
        "projects": projects?.toJson(),
      };
}

class ListProjects {
  List<ProjectModel>? data;
  Pagination? pagination;

  ListProjects({
    this.data,
    this.pagination,
  });

  factory ListProjects.fromJson(Map<String, dynamic> json) => ListProjects(
        data: json["data"] == null
            ? []
            : List<ProjectModel>.from(
                json["data"]!.map((x) => ProjectModel.fromJson(x))),
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

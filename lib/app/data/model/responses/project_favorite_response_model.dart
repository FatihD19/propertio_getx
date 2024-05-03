import 'package:propertio_getx/app/data/model/pagination_model.dart';
import 'package:propertio_getx/app/data/model/proyek_model.dart';

class ProjectFavoriteResponseModel {
  String? status;
  String? message;
  ProjectFavorite? data;

  ProjectFavoriteResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProjectFavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      ProjectFavoriteResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ProjectFavorite.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProjectFavorite {
  List<ProjectModel>? projectFavorites;
  Pagination? pagination;

  ProjectFavorite({
    this.projectFavorites,
    this.pagination,
  });

  factory ProjectFavorite.fromJson(Map<String, dynamic> json) =>
      ProjectFavorite(
        projectFavorites: json["project_favorites"] == null
            ? []
            : List<ProjectModel>.from(json["project_favorites"]!
                .map((x) => ProjectModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "project_favorites": projectFavorites == null
            ? []
            : List<dynamic>.from(projectFavorites!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

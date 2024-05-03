import 'package:propertio_getx/app/data/model/agent_model.dart';
import 'package:propertio_getx/app/data/model/pagination_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';

class PropertyFavoriteResponseModel {
  String? status;
  String? message;
  PropertyFavorite? data;

  PropertyFavoriteResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory PropertyFavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      PropertyFavoriteResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : PropertyFavorite.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class PropertyFavorite {
  List<PropertiModel>? propertyFavorites;
  Pagination? pagination;

  PropertyFavorite({
    this.propertyFavorites,
    this.pagination,
  });

  factory PropertyFavorite.fromJson(Map<String, dynamic> json) =>
      PropertyFavorite(
        propertyFavorites: json["property_favorites"] == null
            ? []
            : List<PropertiModel>.from(json["property_favorites"]!
                .map((x) => PropertiModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "property_favorites": propertyFavorites == null
            ? []
            : List<dynamic>.from(propertyFavorites!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

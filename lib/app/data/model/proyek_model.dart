import 'package:propertio_getx/app/data/model/developer_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';
import 'package:propertio_getx/app/data/model/unit_model.dart';

class ProjectModel {
  String? projectCode;
  String? title;
  String? headline;
  String? slug;
  PropertyType? propertyType;
  DateTime? postedAt;
  Address? address;
  int? countUnit;
  dynamic price;
  String? photo;
  int? countViews;
  String? certificate;
  int? stockUnit;
  int? countLeads;
  String? status;
  String? completedAt;
  bool? isFavorites;
  DeveloperModel? developer;
  List<UnitModel>? units;

  ProjectModel({
    this.projectCode,
    this.title,
    this.headline,
    this.slug,
    this.propertyType,
    this.postedAt,
    this.address,
    this.countUnit,
    this.price,
    this.photo,
    this.countViews,
    this.certificate,
    this.stockUnit,
    this.countLeads,
    this.status,
    this.completedAt,
    this.isFavorites,
    this.developer,
    this.units,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        projectCode: json["project_code"],
        title: json["title"],
        headline: json["headline"],
        slug: json["slug"],
        propertyType: json["property_type"] == null
            ? null
            : PropertyType.fromJson(json["property_type"]),
        postedAt: json["posted_at"] == null
            ? null
            : DateTime.parse(json["posted_at"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        countUnit: json["count_unit"],
        price: json["price"],
        photo: json["photo"],
        countViews: json["count_views"],
        certificate: json["certificate"],
        stockUnit: json["stock_unit"],
        countLeads: json["count_leads"],
        status: json["status"],
        completedAt: json["completed_at"],
        isFavorites: json["is_favorites"],
        developer: json["developer"] == null
            ? null
            : DeveloperModel.fromJson(json["developer"]),
        units: json["units"] == null
            ? []
            : List<UnitModel>.from(
                json["units"]!.map((x) => UnitModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "project_code": projectCode,
        "title": title,
        "headline": headline,
        "slug": slug,
        "property_type": propertyType?.toJson(),
        "posted_at": postedAt?.toIso8601String(),
        "address": address?.toJson(),
        "count_unit": countUnit,
        "price": price,
        "photo": photo,
        "count_views": countViews,
        "certificate": certificate,
        "stock_unit": stockUnit,
        "count_leads": countLeads,
        "status": status,
        "completed_at": completedAt,
        "is_favorites": isFavorites,
        "developer": developer?.toJson(),
        "units": units == null
            ? []
            : List<dynamic>.from(units!.map((x) => x.toJson())),
      };
}

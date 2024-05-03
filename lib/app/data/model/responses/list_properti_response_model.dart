import 'package:propertio_getx/app/data/model/agent_model.dart';
import 'package:propertio_getx/app/data/model/pagination_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';
import 'package:propertio_getx/app/data/model/proyek_model.dart';

class ListPropertyModel {
  String? status;
  String? message;
  Data? data;

  ListPropertyModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListPropertyModel.fromJson(Map<String, dynamic> json) =>
      ListPropertyModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<ProjectModel>? projects;
  List<PropertiModel>? properties;
  List<AgentModel>? agents;
  Pagination? pagination;

  Data({
    this.projects,
    this.properties,
    this.agents,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        projects: json["projects"] == null
            ? []
            : List<ProjectModel>.from(
                json["projects"]!.map((x) => ProjectModel.fromJson(x))),
        properties: json["properties"] == null
            ? []
            : List<PropertiModel>.from(
                json["properties"]!.map((x) => PropertiModel.fromJson(x))),
        agents: json["agents"] == null
            ? []
            : List<AgentModel>.from(
                json["agents"]!.map((x) => AgentModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "projects": projects == null
            ? []
            : List<dynamic>.from(projects!.map((x) => x.toJson())),
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
        "agents": agents == null
            ? []
            : List<dynamic>.from(agents!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

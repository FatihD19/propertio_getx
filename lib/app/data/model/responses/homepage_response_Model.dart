import 'package:propertio_getx/app/data/model/agent_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';
import 'package:propertio_getx/app/data/model/proyek_model.dart';

class HomePageModel {
  String? status;
  String? message;
  Data? data;

  HomePageModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
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
  List<ProjectModel>? projectRecomendation;
  List<PropertiModel>? propertyRecomendation;
  List<ProjectModel>? projectLatest;
  List<AgentModel>? agents;

  Data({
    this.projectRecomendation,
    this.propertyRecomendation,
    this.projectLatest,
    this.agents,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        projectRecomendation: json["project_recomendation"] == null
            ? []
            : List<ProjectModel>.from(json["project_recomendation"]!
                .map((x) => ProjectModel.fromJson(x))),
        propertyRecomendation: json["property_recomendation"] == null
            ? []
            : List<PropertiModel>.from(json["property_recomendation"]!
                .map((x) => PropertiModel.fromJson(x))),
        projectLatest: json["project_latest"] == null
            ? []
            : List<ProjectModel>.from(
                json["project_latest"]!.map((x) => ProjectModel.fromJson(x))),
        agents: json["agents"] == null
            ? []
            : List<AgentModel>.from(
                json["agents"]!.map((x) => AgentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "project_recomendation": projectRecomendation == null
            ? []
            : List<dynamic>.from(projectRecomendation!.map((x) => x.toJson())),
        "property_recomendation": propertyRecomendation == null
            ? []
            : List<dynamic>.from(propertyRecomendation!.map((x) => x.toJson())),
        "project_latest": projectLatest == null
            ? []
            : List<dynamic>.from(projectLatest!.map((x) => x.toJson())),
        "agents": agents == null
            ? []
            : List<dynamic>.from(agents!.map((x) => x.toJson())),
      };
}

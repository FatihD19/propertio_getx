import 'package:propertio_getx/app/data/model/agent_model.dart';
import 'package:propertio_getx/app/data/model/pagination_model.dart';

class ListAgentModel {
  String? status;
  String? message;
  Data? data;

  ListAgentModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListAgentModel.fromJson(Map<String, dynamic> json) => ListAgentModel(
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
  List<AgentModel>? agents;
  Pagination? pagination;

  Data({
    this.agents,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        agents: json["agents"] == null
            ? []
            : List<AgentModel>.from(
                json["agents"]!.map((x) => AgentModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "agents": agents == null
            ? []
            : List<dynamic>.from(agents!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

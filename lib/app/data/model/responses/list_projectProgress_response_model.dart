import 'package:propertio_getx/app/data/model/project_progress_model.dart';

class ListProjectProgressResponseModel {
  String? status;
  String? message;
  List<ProjectProgressModel>? data;

  ListProjectProgressResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListProjectProgressResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ListProjectProgressResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ProjectProgressModel>.from(
                json["data"]!.map((x) => ProjectProgressModel.fromJson(x))),
      );
}

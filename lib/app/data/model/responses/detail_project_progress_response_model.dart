import 'package:propertio_getx/app/data/model/detail_project_progress_model.dart';

class DetailProjectProgressResponseModel {
  String? status;
  String? message;
  DetailProjectProgressModel? data;

  DetailProjectProgressResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailProjectProgressResponseModel.fromJson(
          Map<String, dynamic> json) =>
      DetailProjectProgressResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DetailProjectProgressModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

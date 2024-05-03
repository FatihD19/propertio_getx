import 'package:propertio_getx/app/data/model/project_progress_model.dart';

class ProgressProjectPageResponseModel {
  String? status;
  String? message;
  ProjectProgressModel? data;

  ProgressProjectPageResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProgressProjectPageResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ProgressProjectPageResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ProjectProgressModel.fromJson(json["data"]),
      );
}

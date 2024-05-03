import 'package:propertio_getx/app/data/model/chat_model.dart';

class ListChatResponseModel {
  String? status;
  String? message;
  List<ChatModel>? data;

  ListChatResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListChatResponseModel.fromJson(Map<String, dynamic> json) =>
      ListChatResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ChatModel>.from(
                json["data"]!.map((x) => ChatModel.fromJson(x))),
      );
}

class ChatModel {
  int? id;
  String? projectProgressId;
  String? sender;
  String? receiver;
  String? message;
  DateTime? createdAt;
  String? status;

  ChatModel({
    this.id,
    this.projectProgressId,
    this.sender,
    this.receiver,
    this.message,
    this.createdAt,
    this.status,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        projectProgressId: json["project_progress_id"],
        sender: json["sender"],
        receiver: json["receiver"],
        message: json["message"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_progress_id": projectProgressId,
        "sender": sender,
        "receiver": receiver,
        "message": message,
        "created_at": createdAt?.toIso8601String(),
        "status": status,
      };
}

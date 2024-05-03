class ListPropertyTypeResponseModel {
  String? status;
  String? message;
  List<PropertyTypeModel>? data;

  ListPropertyTypeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListPropertyTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      ListPropertyTypeResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PropertyTypeModel>.from(
                json["data"]!.map((x) => PropertyTypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PropertyTypeModel {
  int? id;
  String? name;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;

  PropertyTypeModel({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) =>
      PropertyTypeModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

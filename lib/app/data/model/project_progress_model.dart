class ProjectProgressModel {
  int? id;
  String? title;
  String? developerName;
  String? developerPhone;
  String? address;
  String? district;
  String? city;
  String? province;
  String? status;
  String? price;
  String? startDate;
  String? endDate;
  String? progressPercentage;
  List<Progress>? progresses;

  ProjectProgressModel({
    this.id,
    this.title,
    this.developerName,
    this.developerPhone,
    this.address,
    this.district,
    this.city,
    this.province,
    this.status,
    this.price,
    this.startDate,
    this.endDate,
    this.progressPercentage,
    this.progresses,
  });

  factory ProjectProgressModel.fromJson(Map<String, dynamic> json) =>
      ProjectProgressModel(
        id: json["id"],
        title: json["title"],
        developerName: json["developer_name"],
        developerPhone: json["developer_phone"],
        address: json["address"],
        district: json["district"],
        city: json["city"],
        province: json["province"],
        status: json["status"],
        price: json["price"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        progressPercentage: json["progressPercentage"] == null
            ? null
            : json["progressPercentage"],
        progresses: json["progresses"] == null
            ? []
            : List<Progress>.from(
                json["progresses"]!.map((x) => Progress.fromJson(x))),
      );
}

class Progress {
  int? id;
  String? title;
  String? percentage;

  Progress({
    this.id,
    this.title,
    this.percentage,
  });

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        id: json["id"],
        title: json["title"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "percentage": percentage,
      };
}

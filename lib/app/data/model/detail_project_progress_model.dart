class DetailProjectProgressModel {
  int? id;
  String? briefDescription;
  String? detailDescription;
  List<Picture>? pictures;

  DetailProjectProgressModel({
    this.id,
    this.briefDescription,
    this.detailDescription,
    this.pictures,
  });

  factory DetailProjectProgressModel.fromJson(Map<String, dynamic> json) =>
      DetailProjectProgressModel(
        id: json["id"],
        briefDescription: json["brief_description"],
        detailDescription: json["detail_description"],
        pictures: json["pictures"] == null
            ? []
            : List<Picture>.from(
                json["pictures"]!.map((x) => Picture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brief_description": briefDescription,
        "detail_description": detailDescription,
        "pictures": pictures == null
            ? []
            : List<dynamic>.from(pictures!.map((x) => x.toJson())),
      };
}

class Picture {
  int? id;
  String? pictureFile;

  Picture({
    this.id,
    this.pictureFile,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        id: json["id"],
        pictureFile: json["picture_file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture_file": pictureFile,
      };
}

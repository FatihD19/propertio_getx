class SendMessagePropertyRequestModel {
  String? name;
  String? phone;
  String? email;
  String? propertyCode;
  String? type;

  SendMessagePropertyRequestModel({
    this.name,
    this.phone,
    this.email,
    this.propertyCode,
    this.type,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "property_code": propertyCode,
        "type": 'property',
      };
}

class SendMessageProjectRequestModel {
  String? name;
  String? phone;
  String? email;
  String? projectCode;
  String? type;

  SendMessageProjectRequestModel({
    this.name,
    this.phone,
    this.email,
    this.projectCode,
    this.type,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "project_code": projectCode,
        "type": 'project',
      };
}

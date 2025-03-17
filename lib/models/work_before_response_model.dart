// To parse this JSON data, do
//
//     final workBeforeResponseModel = workBeforeResponseModelFromJson(jsonString);

import 'dart:convert';

WorkBeforeResponseModel workBeforeResponseModelFromJson(String str) =>
    WorkBeforeResponseModel.fromJson(json.decode(str));

String workBeforeResponseModelToJson(WorkBeforeResponseModel data) =>
    json.encode(data.toJson());

class WorkBeforeResponseModel {
  String status;
  String error;
  ValidationErrors validationErrors;
  OData oData;

  WorkBeforeResponseModel({
    required this.status,
    required this.error,
    required this.validationErrors,
    required this.oData,
  });

  factory WorkBeforeResponseModel.fromJson(Map<String, dynamic> json) =>
      WorkBeforeResponseModel(
        status: json["status"],
        error: json["error"],
        validationErrors: ValidationErrors.fromJson(json["validationErrors"]),
        oData: OData.fromJson(json["oData"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "validationErrors": validationErrors.toJson(),
        "oData": oData.toJson(),
      };
}

class OData {
  String beforeImage;

  OData({
    required this.beforeImage,
  });

  factory OData.fromJson(Map<String, dynamic> json) => OData(
        beforeImage: json["before_image"],
      );

  Map<String, dynamic> toJson() => {
        "before_image": beforeImage,
      };
}

class ValidationErrors {
  ValidationErrors();

  factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
      ValidationErrors();

  Map<String, dynamic> toJson() => {};
}

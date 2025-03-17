// To parse this JSON data, do
//
//     final workAfterResponseModel = workAfterResponseModelFromJson(jsonString);

import 'dart:convert';

WorkAfterResponseModel workAfterResponseModelFromJson(String str) =>
    WorkAfterResponseModel.fromJson(json.decode(str));

String workAfterResponseModelToJson(WorkAfterResponseModel data) =>
    json.encode(data.toJson());

class WorkAfterResponseModel {
  String status;
  String error;
  ValidationErrors validationErrors;
  OData oData;

  WorkAfterResponseModel({
    required this.status,
    required this.error,
    required this.validationErrors,
    required this.oData,
  });

  factory WorkAfterResponseModel.fromJson(Map<String, dynamic> json) =>
      WorkAfterResponseModel(
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
  String afterImage;

  OData({
    required this.afterImage,
  });

  factory OData.fromJson(Map<String, dynamic> json) => OData(
        afterImage: json["after_image"],
      );

  Map<String, dynamic> toJson() => {
        "after_image": afterImage,
      };
}

class ValidationErrors {
  ValidationErrors();

  factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
      ValidationErrors();

  Map<String, dynamic> toJson() => {};
}

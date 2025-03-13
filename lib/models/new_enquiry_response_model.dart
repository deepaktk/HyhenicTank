// To parse this JSON data, do
//
//     final addEnquiryResponseModel = addEnquiryResponseModelFromJson(jsonString);

import 'dart:convert';

AddEnquiryResponseModel addEnquiryResponseModelFromJson(String str) =>
    AddEnquiryResponseModel.fromJson(json.decode(str));

String addEnquiryResponseModelToJson(AddEnquiryResponseModel data) =>
    json.encode(data.toJson());

class AddEnquiryResponseModel {
  String status;
  String error;
  OData validationErrors;
  OData oData;

  AddEnquiryResponseModel({
    required this.status,
    required this.error,
    required this.validationErrors,
    required this.oData,
  });

  factory AddEnquiryResponseModel.fromJson(Map<String, dynamic> json) =>
      AddEnquiryResponseModel(
        status: json["status"],
        error: json["error"],
        validationErrors: OData.fromJson(json["validationErrors"]),
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
  OData();

  factory OData.fromJson(Map<String, dynamic> json) => OData();

  Map<String, dynamic> toJson() => {};
}

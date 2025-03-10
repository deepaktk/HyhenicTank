// To parse this JSON data, do
//
//     final homePageResponse = homePageResponseFromJson(jsonString);

import 'dart:convert';

HomePageResponse homePageResponseFromJson(String str) =>
    HomePageResponse.fromJson(json.decode(str));

String homePageResponseToJson(HomePageResponse data) =>
    json.encode(data.toJson());

class HomePageResponse {
  String status;
  String error;
  ValidationErrors validationErrors;
  OData oData;

  HomePageResponse({
    required this.status,
    required this.error,
    required this.validationErrors,
    required this.oData,
  });

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      HomePageResponse(
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
  String completedWorks;
  String pendingWorks;
  String todaysWorks;

  OData({
    required this.completedWorks,
    required this.pendingWorks,
    required this.todaysWorks,
  });

  factory OData.fromJson(Map<String, dynamic> json) => OData(
        completedWorks: json["completed_works"],
        pendingWorks: json["pending_works"],
        todaysWorks: json["todays_works"],
      );

  Map<String, dynamic> toJson() => {
        "completed_works": completedWorks,
        "pending_works": pendingWorks,
        "todays_works": todaysWorks,
      };
}

class ValidationErrors {
  ValidationErrors();

  factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
      ValidationErrors();

  Map<String, dynamic> toJson() => {};
}

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String status;
    String error;
    OData validationErrors;
    OData oData;
    String accessToken;

    LoginResponse({
        required this.status,
        required this.error,
        required this.validationErrors,
        required this.oData,
        required this.accessToken,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        error: json["error"],
        validationErrors: OData.fromJson(json["validationErrors"]),
        oData: OData.fromJson(json["oData"]),
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "validationErrors": validationErrors.toJson(),
        "oData": oData.toJson(),
        "access_token": accessToken,
    };
}

class OData {
    OData();

    factory OData.fromJson(Map<String, dynamic> json) => OData(
    );

    Map<String, dynamic> toJson() => {
    };
}

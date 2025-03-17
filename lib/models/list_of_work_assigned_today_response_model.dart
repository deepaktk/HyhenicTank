// To parse this JSON data, do
//
//     final listOfWorkTodayResponseModel = listOfWorkTodayResponseModelFromJson(jsonString);

import 'dart:convert';

ListOfWorkTodayResponseModel listOfWorkTodayResponseModelFromJson(String str) => ListOfWorkTodayResponseModel.fromJson(json.decode(str));

String listOfWorkTodayResponseModelToJson(ListOfWorkTodayResponseModel data) => json.encode(data.toJson());

class ListOfWorkTodayResponseModel {
    String status;
    String error;
    ValidationErrors validationErrors;
    OData oData;

    ListOfWorkTodayResponseModel({
        required this.status,
        required this.error,
        required this.validationErrors,
        required this.oData,
    });

    factory ListOfWorkTodayResponseModel.fromJson(Map<String, dynamic> json) => ListOfWorkTodayResponseModel(
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
    List<WorkDetail> workDetails;

    OData({
        required this.workDetails,
    });

    factory OData.fromJson(Map<String, dynamic> json) => OData(
        workDetails: List<WorkDetail>.from(json["work_details"].map((x) => WorkDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "work_details": List<dynamic>.from(workDetails.map((x) => x.toJson())),
    };
}

class WorkDetail {
    String id;
    String employeId;
    String workId;
    String tankId;
    String clientId;
    DateTime workDate;
    String clientName;
    String clientType;
    String franchiseId;
    String orgType;
    String address;
    String landmark;
    String state;
    String district;
    String latitude;
    String longitude;
    String town;
    String location;
    String reference;
    String leadStatus;
    String mode;
    String amount;
    DateTime entryDate;
    DateTime tentativeDate;
    String followUpDate;
    String createdBy;
    DateTime createdOn;
    String modifiedBy;
    String modifiedOn;
    String isDeleted;

    WorkDetail({
        required this.id,
        required this.employeId,
        required this.workId,
        required this.tankId,
        required this.clientId,
        required this.workDate,
        required this.clientName,
        required this.clientType,
        required this.franchiseId,
        required this.orgType,
        required this.address,
        required this.landmark,
        required this.state,
        required this.district,
        required this.latitude,
        required this.longitude,
        required this.town,
        required this.location,
        required this.reference,
        required this.leadStatus,
        required this.mode,
        required this.amount,
        required this.entryDate,
        required this.tentativeDate,
        required this.followUpDate,
        required this.createdBy,
        required this.createdOn,
        required this.modifiedBy,
        required this.modifiedOn,
        required this.isDeleted,
    });

    factory WorkDetail.fromJson(Map<String, dynamic> json) => WorkDetail(
        id: json["id"],
        employeId: json["employe_id"],
        workId: json["work_id"],
        clientId: json["client_id"],
        tankId: json["tankId"],
        workDate: DateTime.parse(json["work_date"]),
        clientName: json["client_name"],
        clientType: json["client_type"],
        franchiseId: json["franchise_id"],
        orgType: json["org_type"],
        address: json["address"],
        landmark: json["landmark"],
        state: json["state"],
        district: json["district"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        town: json["town"],
        location: json["location"],
        reference: json["reference"],
        leadStatus: json["lead_status"],
        mode: json["mode"],
        amount: json["amount"],
        entryDate: DateTime.parse(json["entry_date"]),
        tentativeDate: DateTime.parse(json["tentative_date"]),
        followUpDate: json["follow_up_date"],
        createdBy: json["created_by"],
        createdOn: DateTime.parse(json["created_on"]),
        modifiedBy: json["modified_by"],
        modifiedOn: json["modified_on"],
        isDeleted: json["is_deleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employe_id": employeId,
        "work_id": workId,
        "client_id": clientId,
        "tankId": tankId,
        "work_date": "${workDate.year.toString().padLeft(4, '0')}-${workDate.month.toString().padLeft(2, '0')}-${workDate.day.toString().padLeft(2, '0')}",
        "client_name": clientName,
        "client_type": clientType,
        "franchise_id": franchiseId,
        "org_type": orgType,
        "address": address,
        "landmark": landmark,
        "state": state,
        "district": district,
        "latitude": latitude,
        "longitude": longitude,
        "town": town,
        "location": location,
        "reference": reference,
        "lead_status": leadStatus,
        "mode": mode,
        "amount": amount,
        "entry_date": "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
        "tentative_date": "${tentativeDate.year.toString().padLeft(4, '0')}-${tentativeDate.month.toString().padLeft(2, '0')}-${tentativeDate.day.toString().padLeft(2, '0')}",
        "follow_up_date": followUpDate,
        "created_by": createdBy,
        "created_on": createdOn.toIso8601String(),
        "modified_by": modifiedBy,
        "modified_on": modifiedOn,
        "is_deleted": isDeleted,
    };
}

class ValidationErrors {
    ValidationErrors();

    factory ValidationErrors.fromJson(Map<String, dynamic> json) => ValidationErrors(
    );

    Map<String, dynamic> toJson() => {
    };
}

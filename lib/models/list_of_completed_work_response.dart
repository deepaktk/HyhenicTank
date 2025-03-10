// To parse this JSON data, do
//
//     final listOfCompletedWorkResponse = listOfCompletedWorkResponseFromJson(jsonString);

import 'dart:convert';

ListOfCompletedWorkResponse listOfCompletedWorkResponseFromJson(String str) =>
    ListOfCompletedWorkResponse.fromJson(json.decode(str));

String listOfCompletedWorkResponseToJson(ListOfCompletedWorkResponse data) =>
    json.encode(data.toJson());

class ListOfCompletedWorkResponse {
  String status;
  String error;
  ValidationErrors validationErrors;
  OData oData;

  ListOfCompletedWorkResponse({
    required this.status,
    required this.error,
    required this.validationErrors,
    required this.oData,
  });

  factory ListOfCompletedWorkResponse.fromJson(Map<String, dynamic> json) =>
      ListOfCompletedWorkResponse(
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
  List<CompletedWork> completedWorks;

  OData({
    required this.completedWorks,
  });

  factory OData.fromJson(Map<String, dynamic> json) => OData(
        completedWorks: List<CompletedWork>.from(
            json["completed_works"].map((x) => CompletedWork.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "completed_works":
            List<dynamic>.from(completedWorks.map((x) => x.toJson())),
      };
}

class CompletedWork {
  String id;
  String employeId;
  String workId;
  String clientId;
  DateTime workDate;
  String createdBy;
  DateTime createdDate;
  String vehicle;
  String billStatus;
  String billDate;
  String totalAmount;
  String paymentStatus;
  String workCaptureId;
  String tankId;
  String tankType;
  String tankName;
  String tankVolume;
  String beforeImage;
  String afterImage;
  String remarks;
  String completionDate;
  String status;
  String amount;
  String clientName;
  String clientType;
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
  DateTime entryDate;
  DateTime tentativeDate;
  String followUpDate;
  DateTime createdOn;
  String modifiedBy;
  String modifiedOn;
  String isDeleted;

  CompletedWork({
    required this.id,
    required this.employeId,
    required this.workId,
    required this.clientId,
    required this.workDate,
    required this.createdBy,
    required this.createdDate,
    required this.vehicle,
    required this.billStatus,
    required this.billDate,
    required this.totalAmount,
    required this.paymentStatus,
    required this.workCaptureId,
    required this.tankId,
    required this.tankType,
    required this.tankName,
    required this.tankVolume,
    required this.beforeImage,
    required this.afterImage,
    required this.remarks,
    required this.completionDate,
    required this.status,
    required this.amount,
    required this.clientName,
    required this.clientType,
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
    required this.entryDate,
    required this.tentativeDate,
    required this.followUpDate,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.isDeleted,
  });

  factory CompletedWork.fromJson(Map<String, dynamic> json) => CompletedWork(
        id: json["id"],
        employeId: json["employe_id"],
        workId: json["work_id"],
        clientId: json["client_id"],
        workDate: DateTime.parse(json["work_date"]),
        createdBy: json["created_by"],
        createdDate: DateTime.parse(json["created_date"]),
        vehicle: json["vehicle"],
        billStatus: json["bill_status"],
        billDate: json["bill_date"],
        totalAmount: json["total_amount"],
        paymentStatus: json["payment_status"],
        workCaptureId: json["work_capture_id"],
        tankId: json["tankId"],
        tankType: json["tank_type"],
        tankName: json["tank_name"],
        tankVolume: json["tank_volume"],
        beforeImage: json["before_image"],
        afterImage: json["after_image"],
        remarks: json["remarks"],
        completionDate: json["completion_date"],
        status: json["status"],
        amount: json["amount"],
        clientName: json["client_name"],
        clientType: json["client_type"],
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
        entryDate: DateTime.parse(json["entry_date"]),
        tentativeDate: DateTime.parse(json["tentative_date"]),
        followUpDate: json["follow_up_date"],
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
        "work_date":
            "${workDate.year.toString().padLeft(4, '0')}-${workDate.month.toString().padLeft(2, '0')}-${workDate.day.toString().padLeft(2, '0')}",
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "vehicle": vehicle,
        "bill_status": billStatus,
        "bill_date": billDate,
        "total_amount": totalAmount,
        "payment_status": paymentStatus,
        "work_capture_id": workCaptureId,
        "tankId": tankId,
        "tank_type": tankType,
        "tank_name": tankName,
        "tank_volume": tankVolume,
        "before_image": beforeImage,
        "after_image": afterImage,
        "remarks": remarks,
        "completion_date": completionDate,
        "status": status,
        "amount": amount,
        "client_name": clientName,
        "client_type": clientType,
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
        "entry_date":
            "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
        "tentative_date":
            "${tentativeDate.year.toString().padLeft(4, '0')}-${tentativeDate.month.toString().padLeft(2, '0')}-${tentativeDate.day.toString().padLeft(2, '0')}",
        "follow_up_date": followUpDate,
        "created_on": createdOn.toIso8601String(),
        "modified_by": modifiedBy,
        "modified_on": modifiedOn,
        "is_deleted": isDeleted,
      };
}

class ValidationErrors {
  ValidationErrors();

  factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
      ValidationErrors();

  Map<String, dynamic> toJson() => {};
}

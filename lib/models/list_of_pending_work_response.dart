// // To parse this JSON data, do
// //
// //     final listOfPendingWorkResponse = listOfPendingWorkResponseFromJson(jsonString);

// import 'dart:convert';

// ListOfPendingWorkResponse listOfPendingWorkResponseFromJson(String str) =>
//     ListOfPendingWorkResponse.fromJson(json.decode(str));

// String listOfPendingWorkResponseToJson(ListOfPendingWorkResponse data) =>
//     json.encode(data.toJson());

// class ListOfPendingWorkResponse {
//   String status;
//   String error;
//   ValidationErrors validationErrors;
//   OData oData;

//   ListOfPendingWorkResponse({
//     required this.status,
//     required this.error,
//     required this.validationErrors,
//     required this.oData,
//   });

//   factory ListOfPendingWorkResponse.fromJson(Map<String, dynamic> json) =>
//       ListOfPendingWorkResponse(
//         status: json["status"],
//         error: json["error"],
//         validationErrors: ValidationErrors.fromJson(json["validationErrors"]),
//         oData: OData.fromJson(json["oData"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "error": error,
//         "validationErrors": validationErrors.toJson(),
//         "oData": oData.toJson(),
//       };
// }

// class OData {
//   List<CompletedWork> completedWorks;

//   OData({
//     required this.completedWorks,
//   });

//   factory OData.fromJson(Map<String, dynamic> json) => OData(
//         completedWorks: List<CompletedWork>.from(
//             json["completed_works"].map((x) => CompletedWork.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "completed_works":
//             List<dynamic>.from(completedWorks.map((x) => x.toJson())),
//       };
// }

// class CompletedWork {
//   String id;
//   String employeId;
//   String workId;
//   ClientId clientId;
//   DateTime workDate;
//   String createdBy;
//   DateTime createdDate;
//   String vehicle;
//   String billStatus;
//   String billDate;
//   String totalAmount;
//   Status paymentStatus;
//   String workCaptureId;
//   String tankId;
//   TankType tankType;
//   String tankName;
//   String tankVolume;
//   String beforeImage;
//   String afterImage;
//   String remarks;
//   String completionDate;
//   Status status;
//   String amount;
//   ClientName clientName;
//   String clientType;
//   String orgType;
//   Address address;
//   Landmark landmark;
//   String state;
//   String district;
//   String latitude;
//   String longitude;
//   Town town;
//   Location location;
//   String reference;
//   String leadStatus;
//   String mode;
//   DateTime entryDate;
//   DateTime tentativeDate;
//   FollowUpDate followUpDate;
//   DateTime createdOn;
//   String modifiedBy;
//   ModifiedOn modifiedOn;
//   String isDeleted;

//   CompletedWork({
//     required this.id,
//     required this.employeId,
//     required this.workId,
//     required this.clientId,
//     required this.workDate,
//     required this.createdBy,
//     required this.createdDate,
//     required this.vehicle,
//     required this.billStatus,
//     required this.billDate,
//     required this.totalAmount,
//     required this.paymentStatus,
//     required this.workCaptureId,
//     required this.tankId,
//     required this.tankType,
//     required this.tankName,
//     required this.tankVolume,
//     required this.beforeImage,
//     required this.afterImage,
//     required this.remarks,
//     required this.completionDate,
//     required this.status,
//     required this.amount,
//     required this.clientName,
//     required this.clientType,
//     required this.orgType,
//     required this.address,
//     required this.landmark,
//     required this.state,
//     required this.district,
//     required this.latitude,
//     required this.longitude,
//     required this.town,
//     required this.location,
//     required this.reference,
//     required this.leadStatus,
//     required this.mode,
//     required this.entryDate,
//     required this.tentativeDate,
//     required this.followUpDate,
//     required this.createdOn,
//     required this.modifiedBy,
//     required this.modifiedOn,
//     required this.isDeleted,
//   });

//   factory CompletedWork.fromJson(Map<String, dynamic> json) => CompletedWork(
//         id: json["id"],
//         employeId: json["employe_id"],
//         workId: json["work_id"],
//         clientId: clientIdValues.map[json["client_id"]]!,
//         workDate: DateTime.parse(json["work_date"]),
//         createdBy: json["created_by"],
//         createdDate: DateTime.parse(json["created_date"]),
//         vehicle: json["vehicle"],
//         billStatus: json["bill_status"],
//         billDate: json["bill_date"],
//         totalAmount: json["total_amount"],
//         paymentStatus: statusValues.map[json["payment_status"]]!,
//         workCaptureId: json["work_capture_id"],
//         tankId: json["tankId"],
//         tankType: tankTypeValues.map[json["tank_type"]]!,
//         tankName: json["tank_name"],
//         tankVolume: json["tank_volume"],
//         beforeImage: json["before_image"],
//         afterImage: json["after_image"],
//         remarks: json["remarks"],
//         completionDate: json["completion_date"],
//         status: statusValues.map[json["status"]]!,
//         amount: json["amount"],
//         clientName: clientNameValues.map[json["client_name"]]!,
//         clientType: json["client_type"],
//         orgType: json["org_type"],
//         address: addressValues.map[json["address"]]!,
//         landmark: landmarkValues.map[json["landmark"]]!,
//         state: json["state"],
//         district: json["district"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         town: townValues.map[json["town"]]!,
//         location: locationValues.map[json["location"]]!,
//         reference: json["reference"],
//         leadStatus: json["lead_status"],
//         mode: json["mode"],
//         entryDate: DateTime.parse(json["entry_date"]),
//         tentativeDate: DateTime.parse(json["tentative_date"]),
//         followUpDate: followUpDateValues.map[json["follow_up_date"]]!,
//         createdOn: DateTime.parse(json["created_on"]),
//         modifiedBy: json["modified_by"],
//         modifiedOn: modifiedOnValues.map[json["modified_on"]]!,
//         isDeleted: json["is_deleted"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "employe_id": employeId,
//         "work_id": workId,
//         "client_id": clientIdValues.reverse[clientId],
//         "work_date":
//             "${workDate.year.toString().padLeft(4, '0')}-${workDate.month.toString().padLeft(2, '0')}-${workDate.day.toString().padLeft(2, '0')}",
//         "created_by": createdBy,
//         "created_date": createdDate.toIso8601String(),
//         "vehicle": vehicle,
//         "bill_status": billStatus,
//         "bill_date": billDate,
//         "total_amount": totalAmount,
//         "payment_status": statusValues.reverse[paymentStatus],
//         "work_capture_id": workCaptureId,
//         "tankId": tankId,
//         "tank_type": tankTypeValues.reverse[tankType],
//         "tank_name": tankName,
//         "tank_volume": tankVolume,
//         "before_image": beforeImage,
//         "after_image": afterImage,
//         "remarks": remarks,
//         "completion_date": completionDate,
//         "status": statusValues.reverse[status],
//         "amount": amount,
//         "client_name": clientNameValues.reverse[clientName],
//         "client_type": clientType,
//         "org_type": orgType,
//         "address": addressValues.reverse[address],
//         "landmark": landmarkValues.reverse[landmark],
//         "state": state,
//         "district": district,
//         "latitude": latitude,
//         "longitude": longitude,
//         "town": townValues.reverse[town],
//         "location": locationValues.reverse[location],
//         "reference": reference,
//         "lead_status": leadStatus,
//         "mode": mode,
//         "entry_date":
//             "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
//         "tentative_date":
//             "${tentativeDate.year.toString().padLeft(4, '0')}-${tentativeDate.month.toString().padLeft(2, '0')}-${tentativeDate.day.toString().padLeft(2, '0')}",
//         "follow_up_date": followUpDateValues.reverse[followUpDate],
//         "created_on": createdOn.toIso8601String(),
//         "modified_by": modifiedBy,
//         "modified_on": modifiedOnValues.reverse[modifiedOn],
//         "is_deleted": isDeleted,
//       };
// }

// enum Address { TEST_ADDRESS }

// final addressValues = EnumValues({"": Address.TEST_ADDRESS});

// enum ClientId { HTCLI_25262 }

// final clientIdValues = EnumValues({"HTCLI/25-26/2": ClientId.HTCLI_25262});

// enum ClientName { TEST }

// final clientNameValues = EnumValues({"Test": ClientName.TEST});

// enum FollowUpDate { THE_00000000 }

// final followUpDateValues =
//     EnumValues({"0000-00-00": FollowUpDate.THE_00000000});

// enum Landmark { TEST_LANDMARK }

// final landmarkValues = EnumValues({"test landmark": Landmark.TEST_LANDMARK});

// enum Location { TEST }

// final locationValues = EnumValues({"test ": Location.TEST});

// enum ModifiedOn { THE_00000000000000 }

// final modifiedOnValues =
//     EnumValues({"0000-00-00 00:00:00": ModifiedOn.THE_00000000000000});

// enum Status { PENDING }

// final statusValues = EnumValues({"Pending": Status.PENDING});

// enum TankType { CONCRETE, SYNTEX }

// final tankTypeValues =
//     EnumValues({"concrete": TankType.CONCRETE, "syntex": TankType.SYNTEX});

// enum Town { TEST_TOWN }

// final townValues = EnumValues({"test town": Town.TEST_TOWN});

// class ValidationErrors {
//   ValidationErrors();

//   factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
//       ValidationErrors();

//   Map<String, dynamic> toJson() => {};
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final listOfPendingWorkResponse = listOfPendingWorkResponseFromJson(jsonString);

import 'dart:convert';

ListOfPendingWorkResponse listOfPendingWorkResponseFromJson(String str) => ListOfPendingWorkResponse.fromJson(json.decode(str));

String listOfPendingWorkResponseToJson(ListOfPendingWorkResponse data) => json.encode(data.toJson());

class ListOfPendingWorkResponse {
    String status;
    String error;
    ValidationErrors validationErrors;
    OData oData;

    ListOfPendingWorkResponse({
        required this.status,
        required this.error,
        required this.validationErrors,
        required this.oData,
    });

    factory ListOfPendingWorkResponse.fromJson(Map<String, dynamic> json) => ListOfPendingWorkResponse(
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
        completedWorks: List<CompletedWork>.from(json["completed_works"].map((x) => CompletedWork.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "completed_works": List<dynamic>.from(completedWorks.map((x) => x.toJson())),
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
    String status;
    String workCaptureId;
    String tankId;
    String tankType;
    String tankName;
    String tankVolume;
    String beforeImage;
    String afterImage;
    String remarks;
    String completionDate;
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
        required this.status,
        required this.workCaptureId,
        required this.tankId,
        required this.tankType,
        required this.tankName,
        required this.tankVolume,
        required this.beforeImage,
        required this.afterImage,
        required this.remarks,
        required this.completionDate,
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
        status: json["status"],
        workCaptureId: json["work_capture_id"],
        tankId: json["tankId"],
        tankType: json["tank_type"],
        tankName: json["tank_name"],
        tankVolume: json["tank_volume"],
        beforeImage: json["before_image"],
        afterImage: json["after_image"],
        remarks: json["remarks"],
        completionDate: json["completion_date"],
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
        "work_date": "${workDate.year.toString().padLeft(4, '0')}-${workDate.month.toString().padLeft(2, '0')}-${workDate.day.toString().padLeft(2, '0')}",
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "vehicle": vehicle,
        "bill_status": billStatus,
        "bill_date": billDate,
        "total_amount": totalAmount,
        "payment_status": paymentStatus,
        "status": status,
        "work_capture_id": workCaptureId,
        "tankId": tankId,
        "tank_type": tankType,
        "tank_name": tankName,
        "tank_volume": tankVolume,
        "before_image": beforeImage,
        "after_image": afterImage,
        "remarks": remarks,
        "completion_date": completionDate,
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
        "entry_date": "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
        "tentative_date": "${tentativeDate.year.toString().padLeft(4, '0')}-${tentativeDate.month.toString().padLeft(2, '0')}-${tentativeDate.day.toString().padLeft(2, '0')}",
        "follow_up_date": followUpDate,
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


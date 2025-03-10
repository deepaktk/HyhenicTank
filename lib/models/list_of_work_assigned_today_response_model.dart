// To parse this JSON data, do
//
//     final listOfWorkAssignedTodayResponse = listOfWorkAssignedTodayResponseFromJson(jsonString);

import 'dart:convert';

ListOfWorkAssignedTodayResponse listOfWorkAssignedTodayResponseFromJson(String str) => ListOfWorkAssignedTodayResponse.fromJson(json.decode(str));

String listOfWorkAssignedTodayResponseToJson(ListOfWorkAssignedTodayResponse data) => json.encode(data.toJson());

class ListOfWorkAssignedTodayResponse {
    String status;
    String error;
    ValidationErrors validationErrors;
    OData oData;

    ListOfWorkAssignedTodayResponse({
        required this.status,
        required this.error,
        required this.validationErrors,
        required this.oData,
    });

    factory ListOfWorkAssignedTodayResponse.fromJson(Map<String, dynamic> json) => ListOfWorkAssignedTodayResponse(
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
    String workCaptureId;
    String clientId;
    DateTime workDate;
    ClientName clientName;
    String clientType;
    String orgType;
    Address address;
    Landmark landmark;
    String state;
    String district;
    String latitude;
    Longitude longitude;
    Town town;
    Location location;
    String reference;
    String leadStatus;
    String mode;
    String amount;
    DateTime entryDate;
    DateTime tentativeDate;
    FollowUpDate followUpDate;
    String createdBy;
    DateTime createdOn;
    String modifiedBy;
    String modifiedOn;
    String isDeleted;

    WorkDetail({
        required this.id,
        required this.employeId,
        required this.workId,
        required this.workCaptureId,
        required this.clientId,
        required this.workDate,
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
        workCaptureId: json["work_capture_id"],
        clientId: json["client_id"],
        workDate: DateTime.parse(json["work_date"]),
        clientName: clientNameValues.map[json["client_name"]]!,
        clientType: json["client_type"],
        orgType: json["org_type"],
        address: addressValues.map[json["address"]]!,
        landmark: landmarkValues.map[json["landmark"]]!,
        state: json["state"],
        district: json["district"],
        latitude: json["latitude"],
        longitude: longitudeValues.map[json["longitude"]]!,
        town: townValues.map[json["town"]]!,
        location: locationValues.map[json["location"]]!,
        reference: json["reference"],
        leadStatus: json["lead_status"],
        mode: json["mode"],
        amount: json["amount"],
        entryDate: DateTime.parse(json["entry_date"]),
        tentativeDate: DateTime.parse(json["tentative_date"]),
        followUpDate: followUpDateValues.map[json["follow_up_date"]]!,
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
        "work_capture_id": workCaptureId,
        "client_id": clientId,
        "work_date": "${workDate.year.toString().padLeft(4, '0')}-${workDate.month.toString().padLeft(2, '0')}-${workDate.day.toString().padLeft(2, '0')}",
        "client_name": clientNameValues.reverse[clientName],
        "client_type": clientType,
        "org_type": orgType,
        "address": addressValues.reverse[address],
        "landmark": landmarkValues.reverse[landmark],
        "state": state,
        "district": district,
        "latitude": latitude,
        "longitude": longitudeValues.reverse[longitude],
        "town": townValues.reverse[town],
        "location": locationValues.reverse[location],
        "reference": reference,
        "lead_status": leadStatus,
        "mode": mode,
        "amount": amount,
        "entry_date": "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
        "tentative_date": "${tentativeDate.year.toString().padLeft(4, '0')}-${tentativeDate.month.toString().padLeft(2, '0')}-${tentativeDate.day.toString().padLeft(2, '0')}",
        "follow_up_date": followUpDateValues.reverse[followUpDate],
        "created_by": createdBy,
        "created_on": createdOn.toIso8601String(),
        "modified_by": modifiedBy,
        "modified_on": modifiedOn,
        "is_deleted": isDeleted,
    };
}

enum Address {
    CORDS_INNOVATIONS_PVT_LIMITED,
    EXERCITATIONEM_IPSAM
}

final addressValues = EnumValues({
    "Cords Innovations Pvt Limited": Address.CORDS_INNOVATIONS_PVT_LIMITED,
    "Exercitationem ipsam": Address.EXERCITATIONEM_IPSAM
});

enum ClientName {
    MONTANA,
    PRASANTH
}

final clientNameValues = EnumValues({
    "Montana": ClientName.MONTANA,
    "Prasanth": ClientName.PRASANTH
});

enum FollowUpDate {
    THE_00000000
}

final followUpDateValues = EnumValues({
    "0000-00-00": FollowUpDate.THE_00000000
});

enum Landmark {
    ISTE_DELENITI_MINIM,
    NEAR_SILVER_BELLS_SALOON
}

final landmarkValues = EnumValues({
    "Iste deleniti minim ": Landmark.ISTE_DELENITI_MINIM,
    "Near Silver Bells saloon": Landmark.NEAR_SILVER_BELLS_SALOON
});

enum Location {
    TELENGANA,
    UT_TEMPORIBUS_IMPEDI
}

final locationValues = EnumValues({
    "Telengana": Location.TELENGANA,
    "Ut temporibus impedi": Location.UT_TEMPORIBUS_IMPEDI
});

enum Longitude {
    ACCUSAMUS_CULPA_DIC,
    THE_9_WRY58734
}

final longitudeValues = EnumValues({
    "Accusamus culpa dic": Longitude.ACCUSAMUS_CULPA_DIC,
    "9wry58734": Longitude.THE_9_WRY58734
});

enum Town {
    CHITTOOT,
    EST_SED_NEMO_CONSEQU
}

final townValues = EnumValues({
    "Chittoot": Town.CHITTOOT,
    "Est sed nemo consequ": Town.EST_SED_NEMO_CONSEQU
});

class ValidationErrors {
    ValidationErrors();

    factory ValidationErrors.fromJson(Map<String, dynamic> json) => ValidationErrors(
    );

    Map<String, dynamic> toJson() => {
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

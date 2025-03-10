// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) =>
    json.encode(data.toJson());

class DashboardResponse {
  String status;
  String error;
  ValidationErrors validationErrors;
  OData oData;

  DashboardResponse({
    required this.status,
    required this.error,
    required this.validationErrors,
    required this.oData,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
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
  EmployeeData employeeData;

  OData({
    required this.employeeData,
  });

  factory OData.fromJson(Map<String, dynamic> json) => OData(
        employeeData: EmployeeData.fromJson(json["employee_data"]),
      );

  Map<String, dynamic> toJson() => {
        "employee_data": employeeData.toJson(),
      };
}

class EmployeeData {
  String id;
  String franchiseId;
  String idNo;
  String empId;
  String empCode;
  String empName;
  String mobNo;
  String emailId;
  DateTime dob;
  DateTime doj;
  String gender;
  String bloodGroup;
  String address;
  String type;
  String status;
  String username;
  String password;
  String createdBy;
  DateTime createDate;

  EmployeeData({
    required this.id,
    required this.franchiseId,
    required this.idNo,
    required this.empId,
    required this.empCode,
    required this.empName,
    required this.mobNo,
    required this.emailId,
    required this.dob,
    required this.doj,
    required this.gender,
    required this.bloodGroup,
    required this.address,
    required this.type,
    required this.status,
    required this.username,
    required this.password,
    required this.createdBy,
    required this.createDate,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json["id"],
        franchiseId: json["franchise_id"],
        idNo: json["id_no"],
        empId: json["emp_id"],
        empCode: json["emp_code"],
        empName: json["emp_name"],
        mobNo: json["mob_no"],
        emailId: json["email_id"],
        dob: DateTime.parse(json["dob"]),
        doj: DateTime.parse(json["doj"]),
        gender: json["gender"],
        bloodGroup: json["blood_group"],
        address: json["address"],
        type: json["type"],
        status: json["status"],
        username: json["username"],
        password: json["password"],
        createdBy: json["created_by"],
        createDate: DateTime.parse(json["create_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "franchise_id": franchiseId,
        "id_no": idNo,
        "emp_id": empId,
        "emp_code": empCode,
        "emp_name": empName,
        "mob_no": mobNo,
        "email_id": emailId,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "doj":
            "${doj.year.toString().padLeft(4, '0')}-${doj.month.toString().padLeft(2, '0')}-${doj.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "blood_group": bloodGroup,
        "address": address,
        "type": type,
        "status": status,
        "username": username,
        "password": password,
        "created_by": createdBy,
        "create_date": createDate.toIso8601String(),
      };
}

class ValidationErrors {
  ValidationErrors();

  factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
      ValidationErrors();

  Map<String, dynamic> toJson() => {};
}

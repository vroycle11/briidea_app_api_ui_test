// To parse this JSON data, do
//
//     final group = groupFromJson(jsonString);

import 'dart:convert';

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
    Group({
         this.status,
         this.message,
        this.data,
         this.newGroup,
    });

   final bool? status;
    final String? message;
   final dynamic? data;
   final List<NewGroup>? newGroup;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        status: json["status"],
        message: json["message"],
        data: json["data"],
        newGroup: List<NewGroup>.from(json["new_group"].map((x) => NewGroup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
        "new_group": List<dynamic>.from(newGroup!.map((x) => x.toJson())),
    };
}

class NewGroup {
    NewGroup({
        required this.groupId,
        required this.companyId,
        required this.createdBy,
        required this.chatGroupName,
        required this.groupDescription,
        required this.isActive,
        required this.isDeleted,
        required this.createdOn,
        required this.updatedOn,
        required this.userId,
    });

    String groupId;
    String companyId;
    String createdBy;
    String chatGroupName;
    String groupDescription;
    String isActive;
    String isDeleted;
    DateTime createdOn;
    DateTime updatedOn;
    String userId;

    factory NewGroup.fromJson(Map<String, dynamic> json) => NewGroup(
        groupId: json["group_id"],
        companyId: json["company_id"],
        createdBy: json["created_by"],
        chatGroupName: json["chat_group_name"],
        groupDescription: json["group_description"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "company_id": companyId,
        "created_by": createdBy,
        "chat_group_name": chatGroupName,
        "group_description": groupDescription,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "created_on": createdOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
        "user_id": userId,
    };
}

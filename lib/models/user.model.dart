// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
         this.status,
         this.message,
         this.data,
         this.newChat,
    });

    final bool? status;
    final String? message;
    final List<Datum>? data;
    final List<NewChat>? newChat;

    factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        newChat: List<NewChat>.from(json["new_chat"].map((x) => NewChat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "new_chat": List<dynamic>.from(newChat!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.messageId,
        this.senderInfo,
        this.receiverInfo,
        required this.message,
        required this.messageTime,
        required this.isSeen,
        required this.isDeleted,
        required this.isDelivered,
        required this.isSent,
        required this.senderMessageId,
        required this.receiverMessageId,
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.companyId,
        required this.countUnseenmessageInfo,
        required this.companyName,
        required this.address,
        required this.designationName,
    });

    String messageId;
    dynamic senderInfo;
    dynamic receiverInfo;
    String message;
    DateTime messageTime;
    String isSeen;
    String isDeleted;
    String isDelivered;
    String isSent;
    String senderMessageId;
    String receiverMessageId;
    String id;
    String firstname;
    String lastname;
    String companyId;
    String countUnseenmessageInfo;
    String companyName;
    String address;
    String designationName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        messageId: json["message_id"],
        senderInfo: json["sender_info"],
        receiverInfo: json["receiver_info"],
        message: json["message"],
        messageTime: DateTime.parse(json["message_time"]),
        isSeen: json["is_seen"],
        isDeleted: json["is_deleted"],
        isDelivered: json["is_delivered"],
        isSent: json["is_sent"],
        senderMessageId: json["sender_message_id"],
        receiverMessageId: json["receiver_message_id"],
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        companyId: json["company_id"],
        countUnseenmessageInfo: json["count_unseenmessage_info"],
        companyName: json["company_name"],
        address: json["address"],
        designationName: json["designation_name"],
    );

    Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "sender_info": senderInfo,
        "receiver_info": receiverInfo,
        "message": message,
        "message_time": messageTime.toIso8601String(),
        "is_seen": isSeen,
        "is_deleted": isDeleted,
        "is_delivered": isDelivered,
        "is_sent": isSent,
        "sender_message_id": senderMessageId,
        "receiver_message_id": receiverMessageId,
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "company_id": companyId,
        "count_unseenmessage_info": countUnseenmessageInfo,
        "company_name": companyName,
        "address": address,
        "designation_name": designationName,
    };
}

class NewChat {
    NewChat({
        required this.lastOnlineAt,
        required this.id,
        required this.username,
        required this.password,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.phone,
        required this.gender,
        required this.companyId,
        required this.isActive,
        required this.isDeleted,
        required this.isVerified,
        this.otp,
        required this.isOnline,
        required this.groupId,
        required this.designationName,
        required this.companyName,
        required this.address,
    });

    DateTime lastOnlineAt;
    String id;
    String username;
    String password;
    String email;
    String firstname;
    String lastname;
    String phone;
    String gender;
    String companyId;
    String isActive;
    String isDeleted;
    String isVerified;
    dynamic otp;
    String isOnline;
    String groupId;
    String designationName;
    String companyName;
    String address;

    factory NewChat.fromJson(Map<String, dynamic> json) => NewChat(
        lastOnlineAt: DateTime.parse(json["last_online_at"]),
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        gender: json["gender"],
        companyId: json["company_id"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        isVerified: json["is_verified"],
        otp: json["otp"],
        isOnline: json["is_online"],
        groupId: json["group_id"],
        designationName: json["designation_name"],
        companyName: json["company_name"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "last_online_at": lastOnlineAt.toIso8601String(),
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "gender": gender,
        "company_id": companyId,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "is_verified": isVerified,
        "otp": otp,
        "is_online": isOnline,
        "group_id": groupId,
        "designation_name": designationName,
        "company_name": companyName,
        "address": address,
    };
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int userId;
  String userName;
  String userEmail;
  String userPassword;
  User({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId.toString(),
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      userId: int.parse(map['user_id']),
      userName: map['user_name'] as String,
      userEmail: map['user_email'] as String,
      userPassword: map['user_password'] as String,
    );
  }
}

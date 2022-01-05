import 'dart:convert';

class UserModel {
  UserModel({
    this.location,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.username,
    required this.phoneNumber,
  });

  final String id;
  final Location? location;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String username;
  final String phoneNumber;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        location: json['address'] == null ? null : Location.fromMap(json['address']),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "username": username,
        "phone_number": phoneNumber,
        "location": location?.toMap() ?? {},
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});
  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

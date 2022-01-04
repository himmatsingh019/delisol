import 'dart:convert';

class DeliveryModel {
  DeliveryModel({
    required this.orderId,
    required this.name,
    required this.address,
    required this.mobileNumber,
    required this.fromName,
    required this.fromAddress,
    required this.status,
    required this.startLatitude,
    required this.startLongitude,
    required this.endLatitude,
  });

  final String orderId;
  final String name;
  final String address;
  final String mobileNumber;
  final String fromName;
  final String fromAddress;
  final String status;
  final String startLatitude;
  final String startLongitude;
  final String endLatitude;

  factory DeliveryModel.fromJson(String str) => DeliveryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeliveryModel.fromMap(Map<String, dynamic> json) => DeliveryModel(
        orderId: json["order_id"],
        name: json["Name"],
        address: json["Address"],
        mobileNumber: json["Mobile_number"],
        fromName: json["From_name"],
        fromAddress: json["From_address"],
        status: json["Status"],
        startLatitude: json["start_latitude"],
        startLongitude: json["start_longitude"],
        endLatitude: json["end_latitude"],
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "Name": name,
        "Address": address,
        "Mobile_number": mobileNumber,
        "From_name": fromName,
        "From_address": fromAddress,
        "Status": status,
        "start_latitude": startLatitude,
        "start_longitude": startLongitude,
        "end_latitude": endLatitude,
      };
}

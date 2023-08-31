import 'package:json_annotation/json_annotation.dart';

part 'customer_data.g.dart';

@JsonSerializable()
class CustomerStaticData {
  final String customerID;
  final String customerName;
  final String gender;
  final String title;

  CustomerStaticData({
    required this.customerID,
    required this.customerName,
    required this.gender,
    required this.title,
  });

  factory CustomerStaticData.fromJson(Map<String, dynamic> json) =>
      _$CustomerStaticDataFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerStaticDataToJson(this);
}

@JsonSerializable()
class CustomerTransactionData {
  final String customerID;
  final String transactionDate;
  final int transactionAmount;
  final String transactionDirection;
  final String transactionNarration;

  CustomerTransactionData({
    required this.customerID,
    required this.transactionDate,
    required this.transactionAmount,
    required this.transactionDirection,
    required this.transactionNarration,
  });

  factory CustomerTransactionData.fromJson(Map<String, dynamic> json) =>
      _$CustomerTransactionDataFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerTransactionDataToJson(this);
}

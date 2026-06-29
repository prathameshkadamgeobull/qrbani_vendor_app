import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String orderNo;
  final String animal;
  final String pickupTime;
  final String customerName;
  final String location;
  final double amount;
  final String status;

  const OrderModel({
    required this.orderNo,
    required this.animal,
    required this.pickupTime,
    required this.customerName,
    required this.location,
    required this.amount,
    required this.status,
  });

  /// Empty Model
  factory OrderModel.empty() {
    return const OrderModel(
      orderNo: '',
      animal: '',
      pickupTime: '',
      customerName: '',
      location: '',
      amount: 0.0,
      status: '',
    );
  }

  /// From JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNo: json['orderNo']?.toString() ?? '',
      animal: json['animal']?.toString() ?? '',
      pickupTime: json['pickupTime']?.toString() ?? '',
      customerName: json['customerName']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      status: json['status']?.toString() ?? '',
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      "orderNo": orderNo,
      "animal": animal,
      "pickupTime": pickupTime,
      "customerName": customerName,
      "location": location,
      "amount": amount,
      "status": status,
    };
  }

  /// CopyWith
  OrderModel copyWith({
    String? orderNo,
    String? animal,
    String? pickupTime,
    String? customerName,
    String? location,
    double? amount,
    String? status,
  }) {
    return OrderModel(
      orderNo: orderNo ?? this.orderNo,
      animal: animal ?? this.animal,
      pickupTime: pickupTime ?? this.pickupTime,
      customerName: customerName ?? this.customerName,
      location: location ?? this.location,
      amount: amount ?? this.amount,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    orderNo,
    animal,
    pickupTime,
    customerName,
    location,
    amount,
    status,
  ];

  @override
  String toString() {
    return 'OrderModel('
        'orderNo: $orderNo, '
        'animal: $animal, '
        'pickupTime: $pickupTime, '
        'customerName: $customerName, '
        'location: $location, '
        'amount: $amount, '
        'status: $status'
        ')';
  }
}
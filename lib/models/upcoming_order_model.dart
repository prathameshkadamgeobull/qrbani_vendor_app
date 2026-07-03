import 'package:equatable/equatable.dart';

class UpcomingOrderModel extends Equatable {
  final String hijriDate;
  final int totalOrders;
  final int butcherCount;

  final int goatCount;
  final int sheepCount;
  final int camelCount;

  const UpcomingOrderModel({
    required this.hijriDate,
    required this.totalOrders,
    required this.butcherCount,
    required this.goatCount,
    required this.sheepCount,
    required this.camelCount,
  });

  UpcomingOrderModel copyWith({
    String? hijriDate,
    int? totalOrders,
    int? butcherCount,
    int? goatCount,
    int? sheepCount,
    int? camelCount,
  }) {
    return UpcomingOrderModel(
      hijriDate: hijriDate ?? this.hijriDate,
      totalOrders: totalOrders ?? this.totalOrders,
      butcherCount: butcherCount ?? this.butcherCount,
      goatCount: goatCount ?? this.goatCount,
      sheepCount: sheepCount ?? this.sheepCount,
      camelCount: camelCount ?? this.camelCount,
    );
  }

  factory UpcomingOrderModel.fromJson(Map<String, dynamic> json) {
    return UpcomingOrderModel(
      hijriDate: json['hijriDate'] ?? '',
      totalOrders: json['totalOrders'] ?? 0,
      butcherCount: json['butcherCount'] ?? 0,
      goatCount: json['goatCount'] ?? 0,
      sheepCount: json['sheepCount'] ?? 0,
      camelCount: json['camelCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hijriDate": hijriDate,
      "totalOrders": totalOrders,
      "butcherCount": butcherCount,
      "goatCount": goatCount,
      "sheepCount": sheepCount,
      "camelCount": camelCount,
    };
  }

  @override
  List<Object?> get props => [
    hijriDate,
    totalOrders,
    butcherCount,
    goatCount,
    sheepCount,
    camelCount,
  ];
}
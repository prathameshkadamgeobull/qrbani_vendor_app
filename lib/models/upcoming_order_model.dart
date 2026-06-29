import 'package:equatable/equatable.dart';

class UpcomingOrderModel extends Equatable {
  final String hijriDate;
  final int totalOrders;

  final int butcherCount;

  final int goatCount;
  final int sheepCount;
  final int camelCount;

  final int completedCount;

  const UpcomingOrderModel({
    required this.hijriDate,
    required this.totalOrders,
    required this.butcherCount,
    required this.goatCount,
    required this.sheepCount,
    required this.camelCount,
    required this.completedCount,
  });

  UpcomingOrderModel copyWith({
    String? hijriDate,
    int? totalOrders,
    int? butcherCount,
    int? goatCount,
    int? sheepCount,
    int? camelCount,
    int? completedCount,
  }) {
    return UpcomingOrderModel(
      hijriDate: hijriDate ?? this.hijriDate,
      totalOrders: totalOrders ?? this.totalOrders,
      butcherCount: butcherCount ?? this.butcherCount,
      goatCount: goatCount ?? this.goatCount,
      sheepCount: sheepCount ?? this.sheepCount,
      camelCount: camelCount ?? this.camelCount,
      completedCount: completedCount ?? this.completedCount,
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
      completedCount: json['completedCount'] ?? 0,
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
      "completedCount": completedCount,
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
    completedCount,
  ];
}
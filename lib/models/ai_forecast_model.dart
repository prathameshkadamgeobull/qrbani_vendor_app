import 'dart:convert';

class AiForecastModel {
  final String animal;
  final String demand;
  final String period;
  final List<double> values;
  final String recommendation;

  final List<double> low;
  final List<double> medium;
  final List<double> high;

  AiForecastModel({
    required this.animal,
    required this.demand,
    required this.period,
    required this.values,
    required this.recommendation,
    required this.low,
    required this.medium,
    required this.high,
  });

  AiForecastModel copyWith({
    String? animal,
    String? demand,
    String? period,
    List<double>? values,
    String? recommendation,
    List<double>? low,
    List<double>? medium,
    List<double>? high,
  }) {
    return AiForecastModel(
      animal: animal ?? this.animal,
      demand: demand ?? this.demand,
      period: period ?? this.period,
      values: values ?? this.values,
      recommendation: recommendation ?? this.recommendation,
      low: low ?? this.low,
      medium: medium ?? this.medium,
      high: high ?? this.high,
    );
  }
  factory AiForecastModel.fromJson(Map<String, dynamic> json) {
    return AiForecastModel(
      animal: json['animal'],
      demand: json['demand'],
      period: json['period'],
      values: List<double>.from(json['values']),
      recommendation: json['recommendation'],
      low: List<double>.from(json['low']),
      medium: List<double>.from(json['medium']),
      high: List<double>.from(json['high']),
    );
  }
}
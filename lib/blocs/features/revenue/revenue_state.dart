import 'package:equatable/equatable.dart';

import '../../../models/revenue_model.dart';

class RevenueState extends Equatable {
  final bool isLoading;
  final RevenueModel? revenue;

  const RevenueState({
    this.isLoading = false,
    this.revenue,
  });

  RevenueState copyWith({
    bool? isLoading,
    RevenueModel? revenue,
  }) {
    return RevenueState(
      isLoading: isLoading ?? this.isLoading,
      revenue: revenue ?? this.revenue,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    revenue,
  ];
}
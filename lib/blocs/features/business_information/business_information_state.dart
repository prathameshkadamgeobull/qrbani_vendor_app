import 'package:equatable/equatable.dart';

import '../../../models/business_information_model.dart';

class BusinessInformationState extends Equatable {
  final bool loading;
  final BusinessInformationModel? business;

  const BusinessInformationState({
    this.loading = false,
    this.business,
  });

  BusinessInformationState copyWith({
    bool? loading,
    BusinessInformationModel? business,
  }) {
    return BusinessInformationState(
      loading: loading ?? this.loading,
      business: business ?? this.business,
    );
  }

  @override
  List<Object?> get props => [
    loading,
    business,
  ];
}
import 'package:equatable/equatable.dart';

import '../../../models/bank_details_model.dart';

class BankDetailsState extends Equatable {
  final bool loading;
  final bool hasBankDetails;
  final BankDetailsModel? bankDetails;
  final String? error;

  const BankDetailsState({
    this.loading = false,
    this.hasBankDetails = false,
    this.bankDetails,
    this.error,
  });

  BankDetailsState copyWith({
    bool? loading,
    bool? hasBankDetails,
    BankDetailsModel? bankDetails,
    String? error,
  }) {
    return BankDetailsState(
      loading: loading ?? this.loading,
      hasBankDetails: hasBankDetails ?? this.hasBankDetails,
      bankDetails: bankDetails,
      error: error,
    );
  }
  @override
  List<Object?> get props => [
    loading,
    hasBankDetails,
    bankDetails,
    error,
  ];
}
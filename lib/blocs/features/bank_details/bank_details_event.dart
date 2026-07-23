import 'package:equatable/equatable.dart';

import '../../../models/bank_details_model.dart';

abstract class BankDetailsEvent extends Equatable {
  const BankDetailsEvent();

  @override
  List<Object?> get props => [];
}

/// Load
class LoadBankDetails extends BankDetailsEvent {}

/// Add
class AddBankDetails extends BankDetailsEvent {
  final BankDetailsModel details;

  const AddBankDetails(this.details);

  @override
  List<Object?> get props => [details];
}

/// Update
class UpdateBankDetails extends BankDetailsEvent {
  final BankDetailsModel details;

  const UpdateBankDetails(this.details);

  @override
  List<Object?> get props => [details];
}

/// Delete
class DeleteBankDetails extends BankDetailsEvent {}
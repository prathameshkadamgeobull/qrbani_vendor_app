import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Screens/bank_details/repositories/bank_details_repository.dart';
import 'bank_details_event.dart';
import 'bank_details_state.dart';

class BankDetailsBloc
    extends Bloc<BankDetailsEvent, BankDetailsState> {
  final BankDetailsRepository repository;

  BankDetailsBloc(this.repository)
      : super(const BankDetailsState()) {
    on<LoadBankDetails>(_load);
    on<UpdateBankDetails>(_update);
    on<DeleteBankDetails>(_delete);
    on<AddBankDetails>(_add);
  }

  Future<void> _add(
      AddBankDetails event,
      Emitter<BankDetailsState> emit,
      ) async {
    await repository.updateBankDetails(event.details);

    emit(
      state.copyWith(
        bankDetails: event.details,
        hasBankDetails: true,
      ),
    );
  }

  Future<void> _load(
      LoadBankDetails event,
      Emitter<BankDetailsState> emit,
      ) async {
    emit(state.copyWith(loading: true));

    final details = await repository.getBankDetails();

    emit(
      state.copyWith(
        loading: false,
        bankDetails: details,
        hasBankDetails: details != null,
      ),
    );
  }

  Future<void> _update(
      UpdateBankDetails event,
      Emitter<BankDetailsState> emit,
      ) async {
    await repository.updateBankDetails(event.details);

    emit(
      state.copyWith(
        bankDetails: event.details,
        hasBankDetails: true,
      ),
    );
  }

  Future<void> _delete(
      DeleteBankDetails event,
      Emitter<BankDetailsState> emit,
      ) async {
    await repository.deleteBankDetails();

    emit(
      state.copyWith(
        bankDetails: null,
        hasBankDetails: false,
      ),
    );
  }
}
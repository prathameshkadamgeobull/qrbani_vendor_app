import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/transaction_history/transaction_event.dart';
import 'package:qrbani_vender_app/blocs/features/transaction_history/transaction_state.dart';

import '../../../Screens/transaction_history/repository/transaction_repository.dart';

class TransactionBloc
    extends Bloc<TransactionEvent, TransactionState> {

  final TransactionRepository repository;

  TransactionBloc(this.repository)
      : super(TransactionInitial()) {

    on<LoadTransactions>(_loadTransactions);
  }

  Future<void> _loadTransactions(
      LoadTransactions event,
      Emitter<TransactionState> emit,
      ) async {
    emit(TransactionLoading());

    final data = await repository.fetchTransactions();

    emit(TransactionLoaded(data));
  }
}
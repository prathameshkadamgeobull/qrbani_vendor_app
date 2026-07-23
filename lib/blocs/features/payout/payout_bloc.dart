import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Screens/payout/repository/payout_repository.dart';
import 'payout_event.dart';
import 'payout_state.dart';

class PayoutBloc extends Bloc<PayoutEvent, PayoutState> {
  final PayoutRepository repository = PayoutRepository();

  PayoutBloc() : super(const PayoutState()) {
    on<LoadPayout>(_loadPayout);
    on<RefreshPayout>(_loadPayout);
    on<RequestPayout>(_requestPayout);
    on<DeductBalance>(_deductBalance);

  }


  Future<void> _deductBalance(
      DeductBalance event,
      Emitter<PayoutState> emit,
      ) async {

    if (state.payout == null) return;

    final currentBalance = double.tryParse(
      state.payout!.availableBalance
          .replaceAll(",", "")
          .replaceAll("SAR", "")
          .trim(),
    ) ??
        0;

    final updatedBalance = currentBalance - event.amount;

    emit(
      state.copyWith(
        payout: state.payout!.copyWith(
          availableBalance: updatedBalance.toStringAsFixed(0),
        ),
      ),
    );
  }
  Future<void> _loadPayout(
      PayoutEvent event,
      Emitter<PayoutState> emit,
      ) async {
    // Don't reload if we already have data
    if (state.payout != null) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final data = await repository.getPayoutData();

      emit(
        state.copyWith(
          isLoading: false,
          payout: data,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _requestPayout(
      RequestPayout event,
      Emitter<PayoutState> emit,
      ) async {

    emit(state.copyWith(isLoading: true));

    try {

      // Your payout API call
      // await repository.requestPayout(
      //   amount: event.amount,
      // );

      // Deduct balance after successful payout
      add(
        DeductBalance(event.amount),
      );

      emit(
        state.copyWith(
          isLoading: false,
        ),
      );

    } catch (e) {

      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

}

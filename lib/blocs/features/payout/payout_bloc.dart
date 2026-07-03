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
  }

  Future<void> _loadPayout(
      PayoutEvent event,
      Emitter<PayoutState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final data = await repository.getPayoutData();

      emit(state.copyWith(
        isLoading: false,
        payout: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _requestPayout(
      RequestPayout event,
      Emitter<PayoutState> emit,
      ) async {
    // TODO: implement API call
  }
}
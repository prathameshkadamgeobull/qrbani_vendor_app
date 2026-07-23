import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/review_payout_model.dart';
import 'review_payout_event.dart';
import 'review_payout_state.dart';

class ReviewPayoutBloc
    extends Bloc<ReviewPayoutEvent, ReviewPayoutState> {

  ReviewPayoutBloc()
      : super(ReviewPayoutState.initial()) {

    on<LoadReviewPayout>(_loadReview);

    on<ConfirmPayout>(_confirmPayout);
  }

  Future<void> _loadReview(
      LoadReviewPayout event,
      Emitter<ReviewPayoutState> emit,
      ) async {

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    emit(
      state.copyWith(
        isLoading: false,
        payout: ReviewPayoutModel(
          availableBalance: 78650,
          payoutAmount: event.payoutAmount,
          payoutFee: 0,
          payoutMethod: "Bank Transfer",
          bankName: "Al Rajhi Bank",
          accountNumber: "**** **** **** 5678",
          accountHolder: "Mohammed Khan",
        ),
      ),
    );
  }

  Future<void> _confirmPayout(
      ConfirmPayout event,
      Emitter<ReviewPayoutState> emit,
      ) async {

    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    await Future.delayed(
      const Duration(seconds: 2),
    );

    emit(
      state.copyWith(
        isLoading: false,
        isSuccess: true,
      ),
    );
  }
}
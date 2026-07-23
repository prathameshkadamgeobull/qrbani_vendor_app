import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/request_payout/request_payout_event.dart';
import 'package:qrbani_vender_app/blocs/features/request_payout/request_payout_state.dart';



class RequestPayoutBloc extends Bloc<PayoutEvent,PayoutState>{

  RequestPayoutBloc() : super(PayoutState.initial()){

    on<AmountChanged>((event,emit){

      final amount=double.tryParse(event.amount)??0;

      emit(

        state.copyWith(

          amount:event.amount,

          isValid:
          amount>0 &&
              amount<=state.availableBalance,

        ),

      );

    });

    on<SelectQuickAmount>((event,emit){

      emit(

        state.copyWith(

          amount:event.amount.toStringAsFixed(0),

          isValid:true,

        ),

      );

    }


    );
    on<CompletePayout>((event, emit) {
      final amount = double.tryParse(state.amount) ?? 0;

      emit(
        state.copyWith(
          availableBalance: state.availableBalance - amount,
          amount: "",
          isValid: false,
        ),
      );
    });
  }

}
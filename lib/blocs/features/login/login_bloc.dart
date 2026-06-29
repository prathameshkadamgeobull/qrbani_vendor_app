import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<OtpChanged>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });

    on<SendOtpPressed>((event, emit) async {
      emit(state.copyWith(loading: true));

      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(
        loading: false,
        otpSent: true,
      ));
    });

    on<VerifyOtpPressed>((event, emit) async {
      emit(state.copyWith(
        loading: true,
        errorMessage: null,
      ));

      await Future.delayed(const Duration(seconds: 1));

      if (state.otp == "0001") {
        emit(state.copyWith(
          loading: false,
          loginSuccess: true,
        ));
      } else {
        emit(state.copyWith(
          loading: false,
          loginSuccess: false,
          errorMessage: "Invalid OTP. Please try again.",
        ));
      }
    });
  }
}
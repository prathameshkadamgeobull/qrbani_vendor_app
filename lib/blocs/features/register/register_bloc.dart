import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserNameChanged>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<CountryCodeChanged>((event, emit) {
      emit(state.copyWith(countryCode: event.countryCode));
    });

    on<OtpChanged>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });

    on<SendOtpPressed>((event, emit) async {
      emit(state.copyWith(
        loading: true,
        errorMessage: null,
      ));

      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(
        loading: false,
        otpSent: true,
      ));
    });

    on<RegisterPressed>((event, emit) async {
      emit(state.copyWith(
        loading: true,
        errorMessage: null,
      ));

      await Future.delayed(const Duration(seconds: 1));

      if (state.otp == "0001") {
        emit(state.copyWith(
          loading: false,
          registerSuccess: true,
        ));
      } else {
        emit(state.copyWith(
          loading: false,
          errorMessage: "Invalid OTP",
        ));
      }
    });
  }
}
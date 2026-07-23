import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/repository/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository repository;


  LoginBloc(this.repository) : super(LoginState()) {


    // Phone Number Changed
    on<PhoneChanged>((event, emit) {

      emit(
        state.copyWith(
          phone: event.phone,
        ),
      );
    });



    // OTP Changed
    on<OtpChanged>((event, emit) {

      emit(
        state.copyWith(
          otp: event.otp,
        ),
      );

    });





    // Send OTP API Call
    on<SendOtpPressed>((event, emit) async {


      emit(
        state.copyWith(
          loading: true,
          errorMessage: null,
        ),
      );


      try {


        final result = await repository.sendOtp(
          state.phone,
        );



        if (result) {


          emit(
            state.copyWith(

              loading: false,

              otpSent: true,

            ),
          );


        } else {


          emit(
            state.copyWith(

              loading: false,

              otpSent: false,

              errorMessage: "Failed to send OTP",

            ),
          );


        }


      } catch (e) {


        emit(
          state.copyWith(

            loading: false,

            errorMessage: e.toString(),

          ),
        );


      }


    });







    // Verify OTP API Call
    on<VerifyOtpPressed>((event, emit) async {


      emit(
        state.copyWith(

          loading: true,

          errorMessage: null,

        ),
      );



      try {


        final result = await repository.verifyOtp(

          phone: state.phone,

          otp: state.otp,

        );



        if (result) {


          emit(
            state.copyWith(

              loading: false,

              loginSuccess: true,

            ),
          );


        } else {


          emit(
            state.copyWith(

              loading: false,

              loginSuccess: false,

              errorMessage: "Invalid OTP",

            ),
          );


        }


      } catch (e) {


        emit(
          state.copyWith(

            loading: false,

            loginSuccess: false,

            errorMessage: e.toString(),

          ),
        );


      }


    });


  }

}
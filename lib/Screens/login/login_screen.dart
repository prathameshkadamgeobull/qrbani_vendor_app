import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

import 'package:qrbani_vender_app/Screens/dashboard/dashboard_screen.dart';
import 'package:qrbani_vender_app/Screens/register/register_screen.dart';

import '../../blocs/features/login/login_bloc.dart';
import '../../blocs/features/login/login_event.dart';
import '../../blocs/features/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool isPhoneValid = false;
  String completePhoneNumber = "";

  String? phoneError;

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }

            if (state.loginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const DashboardScreen(),
                ),
              );
            }
          },

          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    const SizedBox(height: 50),

                    const Text(
                      "Welcome Back!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Login with your phone number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 40),
                    IntlPhoneField(
                      controller: phoneController,
                      initialCountryCode: "IN",
                      disableLengthCheck: false,
                      cursorColor: Colors.green,

                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        errorText: phoneError,

                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),

                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),

                      invalidNumberMessage: "Please enter a valid phone number",

                      onChanged: (phone) {

                        completePhoneNumber = phone.completeNumber;

                        setState(() {
                          isPhoneValid = phone.number.length == 10;
                        });


                        context.read<LoginBloc>().add(
                          PhoneChanged(phone.completeNumber),
                        );


                        debugPrint("Phone: ${phone.completeNumber}");
                        debugPrint("Valid: $isPhoneValid");

                      },

                      onCountryChanged: (country) {
                        debugPrint(country.name);
                        debugPrint(country.code);
                        debugPrint(country.dialCode);
                      },
                    ),

                     const SizedBox(height: 25),
                    if (state.otpSent) ...[
                     // const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter OTP",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Pinput(
                        controller: otpController,
                        length: 4,
                        keyboardType: TextInputType.number,

                        forceErrorState: state.errorMessage != null,
                        errorText: state.errorMessage,

                        defaultPinTheme: PinTheme(
                          width: 50,
                          height: 50,
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                        ),

                        focusedPinTheme: PinTheme(
                          width: 65,
                          height: 65,
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: state.errorMessage != null
                                  ? Colors.red
                                  : Colors.green,
                              width: 2,
                            ),
                          ),
                        ),

                        errorPinTheme: PinTheme(
                          width: 65,
                          height: 65,
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),

                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                            OtpChanged(value),
                          );
                        },

                        onCompleted: (value) {
                          context.read<LoginBloc>().add(
                            OtpChanged(value),
                          );
                        },
                      ),

                      const SizedBox(height: 15),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: state.loading
                              ? null
                              : () {
                            otpController.clear();

                            context.read<LoginBloc>().add(
                              SendOtpPressed(),
                            );
                          },
                          child: const Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: state.loading
                            ? null
                            : () {
                          if (!state.otpSent) {
                            setState(() {
                              phoneError = null;
                            });

                            if (!isPhoneValid) {
                              setState(() {
                                phoneError = "Please enter a valid phone number";
                              });
                              return;
                            }

                            context.read<LoginBloc>().add(
                              SendOtpPressed(),
                            );
                          } else {
                            if (otpController.text.length != 4) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Please enter the 4-digit OTP",
                                  ),
                                ),
                              );
                              return;
                            }

                            context.read<LoginBloc>().add(
                              VerifyOtpPressed(),
                            );
                          }
                        },
                        child: state.loading
                            ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                            : Text(
                          state.otpSent
                              ? "Verify OTP"
                              : "Send OTP",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    //const SizedBox(height: 25),

                   //

                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
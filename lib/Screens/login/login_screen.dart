import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String? phoneError;

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
         ),
        );
         }

        if (state.loginSuccess) {
         Navigator.pushReplacement(
         context,
          MaterialPageRoute(
          builder: (_) => const DashboardScreen(), // Change to your home screen
         ),
          );

              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: const Row(
              //       children: [
              //         Icon(Icons.error_outline, color: Colors.white),
              //         SizedBox(width: 10),
              //         Text(
              //           "Invalid OTP. Please try again!",
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),
              //     backgroundColor: Colors.red.shade600,
              //     behavior: SnackBarBehavior.floating,
              //     margin: const EdgeInsets.all(16),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     duration: const Duration(seconds: 2),
              //   ),
              // );
            }
          },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Login with your phone number",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 40),
                   TextField(
                      controller: phoneController,
                     cursorColor: Colors.green,
                       keyboardType: TextInputType.phone,
                      maxLength: 10,
                     onChanged: (value) {
                       context.read<LoginBloc>().add(
                         PhoneChanged(value),
                       );

                       if (phoneError != null) {
                         setState(() {
                           phoneError = null;
                         });
                       }
                     },
                  decoration  : InputDecoration(
                    hintText: "Phone Number",
                    errorText: phoneError,
                    counterText: "",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.2,
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
    ),

                  const SizedBox(height: 20),

                  if (state.otpSent)
                    TextField(
                      controller: otpController,
                      cursorColor: Colors.green,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          OtpChanged(value),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.green,
                        ),
                        errorText: state.errorMessage,

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.2,
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
                    ),
                  const SizedBox(height: 30),

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

                          if (phoneController.text.trim().isEmpty) {
                            setState(() {
                              phoneError = "Please enter your phone number";
                            });
                            return;
                          }

                          if (phoneController.text.trim().length != 10) {
                            setState(() {
                              phoneError = "Please enter a valid 10-digit phone number";
                            });
                            return;
                          }

                          context.read<LoginBloc>().add(
                            PhoneChanged(phoneController.text.trim()),
                          );

                          context.read<LoginBloc>().add(
                            SendOtpPressed(),
                          );
                        } else {
                          context.read<LoginBloc>().add(
                            VerifyOtpPressed(),
                          );
                        }
                      }, // <-- Close the onPressed callback here

                      child: state.loading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        state.otpSent ? "Verify OTP" : "Send OTP",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  if (state.otpSent)
                    TextButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          SendOtpPressed(),
                        );
                      },
                      child: const Text("Resend OTP",
                      style: TextStyle(
                        color: Colors.green,
                      ),),
                    ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
    ),
    ),
    );
    
  }

  // final phoneController = TextEditingController();
  // final otpController = TextEditingController();

  bool validatePhone() {
    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter phone number"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid 10-digit phone number"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }
  
}
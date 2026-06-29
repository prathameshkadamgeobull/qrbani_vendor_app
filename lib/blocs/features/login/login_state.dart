import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginState {

  final String phone;
  final String otp;
  final bool otpSent;
  final bool loading;
  final bool loginSuccess;
  final String? errorMessage;

  LoginState({
    this.phone = '',
    this.otp = '',
    this.otpSent = false,
    this.loading = false,
    this.loginSuccess = false,
    this.errorMessage,
  });

  LoginState copyWith({
    String? phone,
    String? otp,
    bool? otpSent,
    bool? loading,
    bool? loginSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      otpSent: otpSent ?? this.otpSent,
      loading: loading ?? this.loading,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      errorMessage: errorMessage,
    );
  }
}
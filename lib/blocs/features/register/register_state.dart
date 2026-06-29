class RegisterState {
  final String userName;
  final String email;
  final String phone;
  final String countryCode;
  final String otp;

  final bool otpSent;
  final bool loading;
  final bool registerSuccess;

  final String? errorMessage;

  RegisterState({
    this.userName = '',
    this.email = '',
    this.phone = '',
    this.countryCode = '+91',
    this.otp = '',
    this.otpSent = false,
    this.loading = false,
    this.registerSuccess = false,
    this.errorMessage,
  });

  RegisterState copyWith({
    String? userName,
    String? email,
    String? phone,
    String? countryCode,
    String? otp,
    bool? otpSent,
    bool? loading,
    bool? registerSuccess,
    String? errorMessage,
  }) {
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      otp: otp ?? this.otp,
      otpSent: otpSent ?? this.otpSent,
      loading: loading ?? this.loading,
      registerSuccess: registerSuccess ?? this.registerSuccess,
      errorMessage: errorMessage,
    );
  }
}
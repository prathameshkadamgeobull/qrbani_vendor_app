abstract class LoginEvent {}

class PhoneChanged extends LoginEvent {
  final String phone;

  PhoneChanged(this.phone);
}

class SendOtpPressed extends LoginEvent {}

class OtpChanged extends LoginEvent {
  final String otp;

  OtpChanged(this.otp);
}

class VerifyOtpPressed extends LoginEvent {}
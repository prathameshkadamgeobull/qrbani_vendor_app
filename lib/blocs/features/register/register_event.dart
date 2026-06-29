abstract class RegisterEvent {}

class UserNameChanged extends RegisterEvent {
  final String userName;

  UserNameChanged(this.userName);
}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged(this.email);
}

class PhoneChanged extends RegisterEvent {
  final String phone;

  PhoneChanged(this.phone);
}

class CountryCodeChanged extends RegisterEvent {
  final String countryCode;

  CountryCodeChanged(this.countryCode);
}

class OtpChanged extends RegisterEvent {
  final String otp;

  OtpChanged(this.otp);
}

class SendOtpPressed extends RegisterEvent {}

class RegisterPressed extends RegisterEvent {}
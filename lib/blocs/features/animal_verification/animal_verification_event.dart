import 'package:equatable/equatable.dart';

abstract class AnimalVerificationEvent extends Equatable {
  const AnimalVerificationEvent();

  @override
  List<Object?> get props => [];
}

/// Load Animal Details
class LoadAnimalVerification extends AnimalVerificationEvent {
  final String orderNo;
  final String animalType;

  const LoadAnimalVerification(
      this.orderNo,
      this.animalType,
      );

  @override
  List<Object?> get props => [
    orderNo,
    animalType,
  ];
}

/// Verify QR Code
class VerifyAnimal extends AnimalVerificationEvent {
  final String qrCode;

  const VerifyAnimal(this.qrCode);

  @override
  List<Object?> get props => [qrCode];
}

/// Proceed to Sacrifice
class ProceedToSacrifice extends AnimalVerificationEvent {
  const ProceedToSacrifice();
}
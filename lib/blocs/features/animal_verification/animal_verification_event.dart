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
  List<Object?> get props => [orderNo, animalType];
}

/// Verify QR / Barcode
class VerifyAnimal extends AnimalVerificationEvent {
  final String qrCode;

  const VerifyAnimal(this.qrCode);

  @override
  List<Object?> get props => [qrCode];
}

/// Proceed Button
class ProceedToSacrifice extends AnimalVerificationEvent {}
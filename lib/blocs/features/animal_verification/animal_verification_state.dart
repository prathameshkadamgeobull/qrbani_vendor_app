import 'package:equatable/equatable.dart';

import '../../../models/animal_verification_model.dart';

class AnimalVerificationState extends Equatable {
  final bool isLoading;
  final bool isVerified;
  final AnimalVerificationModel? animal;

  const AnimalVerificationState({
    this.isLoading = false,
    this.isVerified = false,
    this.animal,
  });

  AnimalVerificationState copyWith({
    bool? isLoading,
    bool? isVerified,
    AnimalVerificationModel? animal,
  }) {
    return AnimalVerificationState(
      isLoading: isLoading ?? this.isLoading,
      isVerified: isVerified ?? this.isVerified,
      animal: animal ?? this.animal,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isVerified,
    animal,
  ];
}
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/animal_verification_model.dart';
import 'animal_verification_event.dart';
import 'animal_verification_state.dart';

class AnimalVerificationBloc
    extends Bloc<AnimalVerificationEvent, AnimalVerificationState> {
  AnimalVerificationBloc()
      : super(const AnimalVerificationState()) {
    on<LoadAnimalVerification>(_loadAnimal);
    on<VerifyAnimal>(_verifyAnimal);
    on<ProceedToSacrifice>(_proceedToSacrifice);
  }

  Future<void> _loadAnimal(
      LoadAnimalVerification event,
      Emitter<AnimalVerificationState> emit,
      ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    /// Change this value for testing
    String animalType = event.animalType;    // String animalType = "Sheep";
    // String animalType = "Camel";

    late AnimalVerificationModel animal;

    if (animalType.toLowerCase() == "goat") {
      animal = AnimalVerificationModel(
        orderId: event.orderNo,
        animalId: "GOA-2025-001",
        type: "Goat",
        weight: "25 KG",
        qrCode: "QR-GOAT-001",
        image: "assets/images/goat.jpg",
      );
    } else if (animalType.toLowerCase() == "sheep") {
      animal = AnimalVerificationModel(
        orderId: event.orderNo,
        animalId: "SHP-2025-001",
        type: "Sheep",
        weight: "40 KG",
        qrCode: "QR-SHEEP-001",
        image: "assets/images/sheep.jpg",
      );
    } else {
      animal = AnimalVerificationModel(
        orderId: event.orderNo,
        animalId: "CAM-2025-001",
        type: "Camel",
        weight: "420 KG",
        qrCode: "QR-CAMEL-001",
        image: "assets/images/camelshare.jpg",
      );
    }

    emit(
      state.copyWith(
        isLoading: false,
        animal: animal,
        isVerified: true,
      ),
    );
  }

  Future<void> _verifyAnimal(
      VerifyAnimal event,
      Emitter<AnimalVerificationState> emit,
      ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    emit(
      state.copyWith(
        isLoading: false,
        isVerified: true,
      ),
    );
  }

  void _proceedToSacrifice(
      ProceedToSacrifice event,
      Emitter<AnimalVerificationState> emit,
      ) {
    // TODO: Add navigation or API call here
  }
}
  import 'package:equatable/equatable.dart';

  class AnimalVerificationModel extends Equatable {
    final String orderId;
    final String animalId;
    final String type;
    final String weight;
    final String qrCode;
    final String image;

    const AnimalVerificationModel({
      required this.orderId,
      required this.animalId,
      required this.type,
      required this.weight,
      required this.qrCode,
      required this.image,
    });

    AnimalVerificationModel copyWith({
      String? orderId,
      String? animalId,
      String? type,
      String? weight,
      String? qrCode,
      String? image,
    }) {
      return AnimalVerificationModel(
        orderId: orderId ?? this.orderId,
        animalId: animalId ?? this.animalId,
        type: type ?? this.type,
        weight: weight ?? this.weight,
        qrCode: qrCode ?? this.qrCode,
        image: image ?? this.image,
      );
    }

    factory AnimalVerificationModel.fromJson(
        Map<String, dynamic> json) {
      return AnimalVerificationModel(
        orderId: json["orderId"] ?? "",
        animalId: json["animalId"] ?? "",
        type: (json["type"] ?? "").toString().trim(),
        weight: json["weight"] ?? "",
        qrCode: json["qrCode"] ?? "",
        image: json["image"] ?? "",
      );
    }

    Map<String, dynamic> toJson() {
      return {
        "orderId": orderId,
        "animalId": animalId,
        "type": type,
        "weight": weight,
        "qrCode": qrCode,
        "image": image,
      };
    }

    @override
    List<Object?> get props => [
      orderId,
      animalId,
      type,
      weight,
      qrCode,
      image,
    ];
  }
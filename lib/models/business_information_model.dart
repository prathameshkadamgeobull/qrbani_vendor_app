import 'package:equatable/equatable.dart';

class BusinessInformationModel extends Equatable {
  final String vendorId;
  final String businessName;
  final String businessType;
  final String ownerName;
  final String phone;
  final String email;

  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  final String image;

  const BusinessInformationModel({
    required this.vendorId,
    required this.businessName,
    required this.businessType,
    required this.ownerName,
    required this.phone,
    required this.email,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.image,
  });

  @override
  List<Object?> get props => [
    vendorId,
    businessName,
    businessType,
    ownerName,
    phone,
    email,
    addressLine1,
    addressLine2,
    city,
    state,
    country,
    postalCode,
    image,
  ];
}
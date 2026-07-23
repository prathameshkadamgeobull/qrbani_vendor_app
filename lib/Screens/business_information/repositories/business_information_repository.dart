import '../../../models/business_information_model.dart';

class BusinessInformationRepository {
  Future<BusinessInformationModel> getBusinessInformation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const BusinessInformationModel(
      vendorId: "VEN-7845",
      businessName: "Al Noor Slaughterhouse",
      businessType: "Slaughter House",
      ownerName: "Mohammed Khan",
      phone: "+966 50 123 4567",
      email: "alnoor@example.com",
      addressLine1: "Industrial Area, Street 12",
      addressLine2: "Building 45, Unit 3",
      city: "Makkah",
      state: "Makkah Province",
      country: "Saudi Arabia",
      postalCode: "24361",
      image: "assets/images/business_logo.png",
    );
  }
}
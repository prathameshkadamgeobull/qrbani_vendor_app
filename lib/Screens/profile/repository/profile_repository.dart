
import '../../../models/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(seconds: 1));

    return ProfileModel(
      name: "Al Noor Slaughterhouse",
      vendorId: "Vendor ID: Ven7845",
      phone: "+966 50 123 4567",
      email: "alnoor@example.com",
      location: "Makkah, Saudi Arabia",
      image: "assets/images/vendor.png",
    );
  }
}
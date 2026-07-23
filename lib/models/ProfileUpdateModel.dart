class ProfileUpdateModel {

  final String name;
  final String phone;
  final String email;
  final String location;
  final String? imagePath;


  ProfileUpdateModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    this.imagePath,
  });

}
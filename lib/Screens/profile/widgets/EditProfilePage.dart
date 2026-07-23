import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../models/ProfileUpdateModel.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() =>
      _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  String countryCode = "+966";
  String completePhoneNumber = "";

  File? selectedImage;

  final nameController = TextEditingController(
    text: "Ahmed Ali",
  );

  final phoneController = TextEditingController(
    text: "+966 555555555",
  );

  final emailController = TextEditingController(
    text: "ahmed@gmail.com",
  );

  final locationController = TextEditingController(
    text: "Riyadh, Saudi Arabia",
  );


  Future<void> pickImage() async {

    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {

      setState(() {
        selectedImage = File(image.path);
      });

    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),

      ),


      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16),

          child: Column(

            children: [

              const SizedBox(height: 20),


              /// Profile Image

              Stack(

                children: [

                  CircleAvatar(

                    radius: 55,

                    backgroundColor:
                    Colors.grey.shade300,

                    backgroundImage:

                    selectedImage != null

                        ? FileImage(selectedImage!)

                        : const AssetImage(
                      "assets/images/profile.png",
                    ) as ImageProvider,

                  ),


                  Positioned(

                    bottom: 0,

                    right: 0,

                    child: InkWell(

                      onTap: pickImage,

                      child: Container(

                        height: 35,

                        width: 35,

                        decoration: const BoxDecoration(

                          color: Color(0xff0A5A36),

                          shape: BoxShape.circle,

                        ),

                        child: const Icon(

                          Icons.camera_alt,

                          color: Colors.white,

                          size: 18,

                        ),

                      ),

                    ),

                  ),

                ],

              ),


              const SizedBox(height: 30),


              _textField(
                controller: nameController,
                label: "Full Name",
                icon: Icons.person,
              ),


              const SizedBox(height: 16),


              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: const Color(0xff0A5A36), // Green
                  ),
                ),
                child: IntlPhoneField(
                  controller: phoneController,
                  initialCountryCode: "SA",

                  cursorColor: const Color(0xff0A5A36),

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),

                  dropdownTextStyle: const TextStyle(
                    color: Color(0xff0A5A36),
                    fontWeight: FontWeight.w600,
                  ),

                  dropdownIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xff0A5A36),
                  ),

                  decoration: InputDecoration(
                    labelText: "Phone Number",

                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),

                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff0A5A36),
                      fontWeight: FontWeight.w600,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xff0A5A36),
                        width: 1.5,
                      ),
                    ),
                  ),

                  onChanged: (phone) {
                    countryCode = phone.countryCode;
                    completePhoneNumber = phone.completeNumber;
                  },
                ),
              ),


              const SizedBox(height: 16),


              _textField(
                controller: emailController,
                label: "Email Address",
                icon: Icons.email,
                keyboard: TextInputType.emailAddress,
              ),


              const SizedBox(height: 16),


              _textField(
                controller: locationController,
                label: "Location",
                icon: Icons.location_on,
              ),


              const SizedBox(height: 35),


              SizedBox(

                width: double.infinity,

                height: 52,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                    const Color(0xff0A5A36),

                    shape: RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(12),

                    ),

                  ),


                  onPressed: () {

                    final updatedProfile = ProfileUpdateModel(

                      name: nameController.text,

                      phone: phoneController.text,

                      email: emailController.text,

                      location: locationController.text,

                      imagePath: selectedImage?.path,

                    );


                    Navigator.pop(
                      context,
                      updatedProfile,
                    );

                  },


                  child: const Text(

                    "Save Changes",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 16,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }



  Widget _textField({

    required TextEditingController controller,

    required String label,

    required IconData icon,

    TextInputType keyboard =
        TextInputType.text,

  }) {

    return TextField(

      controller: controller,

      keyboardType: keyboard,

      cursorColor: const Color(0xff0A5A36),


      decoration: InputDecoration(

        labelText: label,


        labelStyle: const TextStyle(

          color: Colors.grey,

        ),


        floatingLabelStyle: const TextStyle(

          color: Color(0xff0A5A36),

          fontWeight: FontWeight.w600,

        ),


        prefixIcon: Icon(

          icon,

          color: const Color(0xff0A5A36),

        ),


        filled: true,

        fillColor: Colors.white,


        enabledBorder: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(12),

          borderSide: BorderSide(

            color: Colors.grey.shade300,

          ),

        ),


        focusedBorder: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(12),

          borderSide: const BorderSide(

            color: Color(0xff0A5A36),

            width: 1.5,

          ),

        ),

      ),

    );

  }

}
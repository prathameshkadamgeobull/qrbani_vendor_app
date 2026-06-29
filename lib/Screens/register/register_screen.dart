
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_colors.dart';
import '../../Core/widgets/CustomTextFormField.dart';
import '../../Core/widgets/commonButton.dart';
import '../../blocs/features/register/register_bloc.dart';
import '../../blocs/features/register/register_event.dart';
import '../../blocs/features/register/register_state.dart';
import '../../screens/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {

      if (state.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text(state.errorMessage!),
          ),
        );
      }

      if (state.registerSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const RegisterScreen(),//Home Screen
          ),
        );
      }
    },

    child: Scaffold(
    backgroundColor: Colors.white,

    appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black),
    title: const Text(
    "Create Account",
    style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),

    body: BlocBuilder<RegisterBloc, RegisterState>(
    builder: (context, state) {

    return SingleChildScrollView(
    padding: const EdgeInsets.all(20),

    child: Form(
    key: _formKey,

    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

    const SizedBox(height: 10),

    const Center(
    child: Text(
    "Create your account",
    style: TextStyle(
    fontSize: 16,
    color: Colors.grey,
    ),
    ),
    ),

    const SizedBox(height: 30),

    CustomTextFormField(
    controller: userController,
    hintText: "Username",
    prefixIcon: const Icon(Icons.person_outline),

    onChanged: (value) {
    context.read<RegisterBloc>().add(
    UserNameChanged(value),
    );
    },

    validator: (value) {
    if(value==null || value.isEmpty){
    return "Enter username";
    }
    return null;
    },
    ),

    const SizedBox(height: 18),

    CustomTextFormField(
    controller: emailController,
    hintText: "Email Address",
    keyboardType: TextInputType.emailAddress,
    prefixIcon: const Icon(Icons.email_outlined),

    onChanged: (value) {
    context.read<RegisterBloc>().add(
    EmailChanged(value),
    );
    },

    validator: (value){

    if(value==null || value.isEmpty){
    return "Enter email";
    }

    if(!RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(value)){
    return "Enter valid email";
    }

    return null;
    },
    ),

    const SizedBox(height: 18),

    const Text(
    "Phone Number",
    style: TextStyle(
    fontWeight: FontWeight.w600,
    ),
    ),

    const SizedBox(height: 10),

    Row(
    children: [

      SizedBox(
        width: 80, // Decrease width
        height: 50, // Decrease height
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CountryCodePicker(
            initialSelection: 'IN',
            showFlag: false,
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            showDropDownButton: true,
            favorite: const ['+91'],

            padding: EdgeInsets.zero, // Remove extra padding
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),

            onChanged: (country) {
              context.read<RegisterBloc>().add(
                CountryCodeChanged(country.dialCode!),
              );
            },
          ),
        ),
      ),

    const SizedBox(width: 10),

    Expanded(

    child: CustomTextFormField(

    controller: phoneController,

    keyboardType: TextInputType.phone,

    hintText: "Phone Number",

    onChanged: (value){

    context.read<RegisterBloc>().add(
    PhoneChanged(value),
    );

    },

    validator: (value){

    if(value==null || value.isEmpty){
    return "Enter phone number";
    }

    if(value.length!=10){
    return "Phone must contain 10 digits";
    }

    return null;

    },

    ),

    ),

    ],
    ),
      const SizedBox(height: 20),

      if (state.otpSent)
        CustomTextFormField(
          controller: otpController,
          hintText: "Enter OTP",
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(Icons.lock_outline),

          onChanged: (value) {
            context.read<RegisterBloc>().add(
              OtpChanged(value),
            );
          },

          validator: (value) {
            if (state.otpSent &&
                (value == null || value.isEmpty)) {
              return "Enter OTP";
            }
            return null;
          },
        ),

      const SizedBox(height: 25),

      SizedBox(
        width: double.infinity,
        height: 50,

        child: commonButton(

          buttonColor: AppColors.primaryThemeColor,

          text: state.otpSent
              ? "Register"
              : "Send OTP",

          onPressed: () {

            if (!_formKey.currentState!.validate()) {
              return;
            }

            if (!state.otpSent) {

              context.read<RegisterBloc>().add(
                SendOtpPressed(),
              );

            } else {

              context.read<RegisterBloc>().add(
                RegisterPressed(),
              );

            }

          },

        ),
      ),

      if(state.loading)
        const Padding(
          padding: EdgeInsets.only(top:20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),

      if(state.otpSent)
        Center(
          child: TextButton(
            onPressed: () {

              context.read<RegisterBloc>().add(
                SendOtpPressed(),
              );

            },

            child: Text(
              "Resend OTP",
              style: TextStyle(
                color: AppColors.primaryThemeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

      const SizedBox(height: 30),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          const Text(
            "Already have an account?",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          TextButton(

            onPressed: () {

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const LoginScreen(),
                ),
              );

            },

            child: Text(
              "Login",
              style: TextStyle(
                color: AppColors.primaryThemeColor,
                fontWeight: FontWeight.bold,
              ),
            ),

          ),

        ],
      ),

    ],
    ),
    ),
    );
    },
    ),
    ),
    );
  }
}
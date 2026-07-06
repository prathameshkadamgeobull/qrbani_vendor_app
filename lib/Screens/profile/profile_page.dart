import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/profile/profile_bloc.dart';
import '../../blocs/features/profile/profile_event.dart';
import '../../blocs/features/profile/profile_state.dart';
import '../../core/constants/app_text_style.dart';
import 'widgets/edit_profile_button.dart';
import 'widgets/profile_info_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfile());
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
          "Profile",
          style: AppTextStyles.screenTitle,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProfileLoaded) {
            final profile = state.profile;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      profile.name,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.screenTitle,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      profile.vendorId,
                      style: AppTextStyles.bodySmall,
                    ),

                    const SizedBox(height: 30),

                    Expanded(
                      child: SingleChildScrollView(
                        child: ProfileInfoCard(
                          phone: profile.phone,
                          email: profile.email,
                          location: profile.location,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    EditProfileButton(
                      onPressed: () {},
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }

          if (state is ProfileError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
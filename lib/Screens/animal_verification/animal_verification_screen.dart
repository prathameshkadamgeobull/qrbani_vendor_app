import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_text_style.dart';
import '../../blocs/features/animal_verification/animal_verification_bloc.dart';
import '../../blocs/features/animal_verification/animal_verification_event.dart';
import '../../blocs/features/animal_verification/animal_verification_state.dart';

import '../../blocs/features/live_video/live_video_bloc.dart';
import '../live_video/live_video_page.dart';
import 'widgets/animal_image_card.dart';
import 'widgets/proceed_button.dart';
import 'widgets/verification_header.dart';

class AnimalVerificationScreen extends StatefulWidget {
  final String orderNo;
  final String animalType;



  const AnimalVerificationScreen({
    super.key,
    required this.orderNo,
    required this.animalType,

  });

  @override
  State<AnimalVerificationScreen> createState() =>
      _AnimalVerificationScreenState();
}

class _AnimalVerificationScreenState
    extends State<AnimalVerificationScreen> {

  @override
  void initState() {
    super.initState();

    context.read<AnimalVerificationBloc>().add(
      LoadAnimalVerification(widget.orderNo,widget.animalType,
      ),
    );
  }

  String getAnimalAsset(String type) {
    print("Animal Type from API: $type");

    final t = type.toLowerCase().trim();

    if (t.contains('goat')) {
      return 'assets/images/goat.jpg';
    }

    if (t.contains('sheep')) {
      return 'assets/images/sheep.jpg';
    }

    if (t.contains('camel')) {
      return 'assets/images/camelshare.jpg';
    }

    return 'assets/images/default_animal.jpg';
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(

        child: BlocBuilder<AnimalVerificationBloc,
            AnimalVerificationState>(

          builder: (context, state) {

            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.animal == null) {
              return const Center(
                child: Text("No Animal Found"),
              );
            }

            final animal = state.animal!;

            return Column(

              children: [

                VerificationHeader(
                  onBack: () => Navigator.pop(context),
                  onNotification: () {},
                ),

                Expanded(

                  child: SingleChildScrollView(

                    padding: const EdgeInsets.all(16),

                    child: Column(

                      children: [

                        Text(
                          "Scan animal barcode / QR",
                          style: AppTextStyles.orderSubtitle,
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        AnimalImageCard(
                          animal: animal,
                          image: getAnimalAsset(animal.type),
                          isVerified: state.isVerified,
                        ),

                        const SizedBox(height: 25),

                        ProceedButton(
                          onPressed: () {
                            /// Call Bloc Event
                            context.read<AnimalVerificationBloc>().add(
                              ProceedToSacrifice(),
                            );

                            /// Navigate to Live Video Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => LiveVideoBloc(),
                                  child: const LiveVideoPage(),
                                ),
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
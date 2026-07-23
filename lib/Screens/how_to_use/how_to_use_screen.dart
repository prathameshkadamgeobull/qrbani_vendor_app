import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_colors.dart';
import '../../Core/constants/app_text_style.dart';
import '../../blocs/features/how_to_use/how_to_use_bloc.dart';
import '../../blocs/features/how_to_use/how_to_use_event.dart';
import '../../blocs/features/how_to_use/how_to_use_state.dart';

import '../contact_support/widgets/contact_bottom_sheet.dart';
import 'widgets/guide_header.dart';
import 'widgets/guide_step_card.dart';
import 'widgets/workflow_card.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HowToUseBloc()..add(LoadGuideSteps()),
      child: const _HowToUseView(),
    );
  }
}

class _HowToUseView extends StatelessWidget {
  const _HowToUseView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "How to Use App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: BlocBuilder<HowToUseBloc, HowToUseState>(
        builder: (context, state) {
          if (state is HowToUseLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HowToUseLoaded) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [

                /// Welcome Header
                const GuideHeader(),

                const SizedBox(height: 20),

                /// Workflow
                const WorkflowCard(),

                const SizedBox(height: 24),

                Text(
                  "Step-by-Step Guide",
                  style: AppTextStyles.sectionTitle,
                ),

                const SizedBox(height: 16),

                ...List.generate(
                  state.guideSteps.length,
                      (index) => GuideStepCard(
                    step: state.guideSteps[index],
                  ),
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [

                      const Icon(
                        Icons.support_agent,
                        color: AppColors.primary,
                        size: 40,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "Need More Help?",
                        style: AppTextStyles.cardTitle,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "If you still have questions, our support team is here to help you.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body,
                      ),

                      const SizedBox(height: 18),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {

                           // Navigator.pop(context); // close current bottom sheet


                            Future.delayed(
                              const Duration(milliseconds: 300),
                                  () {

                                showModalBottomSheet(

                                  context: context,

                                  shape: const RoundedRectangleBorder(

                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),

                                  ),

                                  builder: (_) {

                                    return const ContactBottomSheet();

                                  },

                                );

                              },
                            );

                          },
                          child: const Text("Contact Support"),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          }

          return const Center(
            child: Text("Something went wrong"),
          );
        },
      ),
    );
  }
}
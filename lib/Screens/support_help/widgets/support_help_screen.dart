import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_text_style.dart';
import '../../../blocs/features/faq/faq_bloc.dart';
import '../../../blocs/features/faq/faq_event.dart';
import '../../../blocs/features/how_to_use/how_to_use_bloc.dart';
import '../../../blocs/features/how_to_use/how_to_use_event.dart';
import '../../../blocs/features/support_help/support_help_bloc.dart';
import '../../../blocs/features/support_help/support_help_event.dart';
import '../../../blocs/features/support_help/support_help_state.dart';
import '../../../utils/email_launcher.dart';
import '../../contact_support/contact_support_page.dart';
import '../../contact_support/widgets/contact_bottom_sheet.dart';
import '../../faq/faq_screen.dart';
import '../../how_to_use/how_to_use_screen.dart';

class SupportHelpPage extends StatelessWidget {
  const SupportHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SupportHelpBloc()..add(LoadSupportItems()),
      child: const _SupportHelpView(),
    );
  }
}

class _SupportHelpView extends StatelessWidget {
  const _SupportHelpView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.black,
        ),
        title: Text(
          "Support / Help",
          style: AppTextStyles.appBarTitle,
        ),
      ),

      body: BlocConsumer<SupportHelpBloc, SupportHelpState>(
        listener: (context, state) async {
          if (state.navigateIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    BlocProvider(
                      create: (_) =>
                      FaqBloc()
                        ..add(LoadFaqs()),
                      child: const FaqScreen(),
                    ),
              ),
            );

            context.read<SupportHelpBloc>().add(
               SupportItemTapped(-1),
            );
          }
          if (state.navigateIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => HowToUseBloc()
                    ..add(LoadGuideSteps()),
                  child: const HowToUseScreen(),
                ),
              ),
            );

            context.read<SupportHelpBloc>().add(
              SupportItemTapped(-1),
            );
          }
          if (state.navigateIndex == 2) {

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

            context.read<SupportHelpBloc>().add(
              SupportItemTapped(-1),
            );

          }

          if (state.navigateIndex == 3) {
            debugPrint("Email button clicked");

            await EmailLauncher.sendEmail();

            context.read<SupportHelpBloc>().add(
              SupportItemTapped(-1),
            );
          }
        },

        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [

              ...List.generate(
                state.items.length,
                    (index) {
                  final item = state.items[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        context.read<SupportHelpBloc>().add(
                          SupportItemTapped(index),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.textGrey,
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: Icon(
                                item.icon,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: AppTextStyles.cardTitle,
                                  ),

                                  if (item.subtitle != null)
                                    Text(
                                      item.subtitle!,
                                      style: AppTextStyles.cardSubtitle,
                                    ),
                                ],
                              ),
                            ),

                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),

        bottomNavigationBar:
    SafeArea( child:
    Padding( padding: const EdgeInsets.all(16),
    child: SizedBox( height: 52,
    width: double.infinity,
    child: ElevatedButton( style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
      onPressed: () {

        showModalBottomSheet(
          context: context,

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),

          builder: (context) {

            return const ContactBottomSheet();

          },

        );

      },
      child: const Text( "Call Support",
    style: AppTextStyles.button,
        ),
        ),
        ),
        ),
    ),
    );
  }

}
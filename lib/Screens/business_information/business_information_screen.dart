import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_colors.dart';
import '../../Core/constants/app_text_style.dart';

import '../../blocs/features/business_information/business_information_bloc.dart';
import '../../blocs/features/business_information/business_information_event.dart';
import '../../blocs/features/business_information/business_information_state.dart';

import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/address_card.dart';
import 'widgets/business_details_card.dart';
import 'widgets/business_header_card.dart';

class BusinessInformationScreen extends StatefulWidget {
  const BusinessInformationScreen({super.key});

  @override
  State<BusinessInformationScreen> createState() =>
      _BusinessInformationScreenState();
}

class _BusinessInformationScreenState
    extends State<BusinessInformationScreen> {
  @override
  void initState() {
    super.initState();

    context
        .read<BusinessInformationBloc>()
        .add(LoadBusinessInformation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      bottomNavigationBar: const CustomBottomNavigation(
        selectedIndex: 4,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.white,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: 20,
          ),
        ),

        title: Text(
          "Business Information",
          style: AppTextStyles.screenTitle.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),

      body: BlocBuilder<
          BusinessInformationBloc,
          BusinessInformationState>(
        builder: (context, state) {
          if (state.loading || state.business == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final business = state.business!;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            child: Column(
              children: [

                /// Header
                BusinessHeaderCard(
                  business: business,
                ),

                const SizedBox(height: 18),

                /// Business Details
                BusinessDetailsCard(
                  business: business,
                ),

                const SizedBox(height: 18),

                /// Address
                AddressCard(
                  business: business,
                ),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
     // bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
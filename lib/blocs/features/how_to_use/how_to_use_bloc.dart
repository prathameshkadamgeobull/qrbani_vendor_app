import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/guide_step_model.dart';
import 'how_to_use_event.dart';
import 'how_to_use_state.dart';

class HowToUseBloc extends Bloc<HowToUseEvent, HowToUseState> {
  HowToUseBloc() : super(HowToUseInitial()) {
    on<LoadGuideSteps>(_loadGuideSteps);
  }

  void _loadGuideSteps(
      LoadGuideSteps event,
      Emitter<HowToUseState> emit,
      ) {
    emit(HowToUseLoading());

    emit(
      const HowToUseLoaded(
        guideSteps: [
          GuideStepModel(
            step: 1,
            title: "Login",
            description:
            "Sign in using your registered mobile number or email and password to access your vendor account.",
            icon: Icons.login,
          ),

          GuideStepModel(
            step: 2,
            title: "Dashboard",
            description:
            "View today's orders, revenue, inventory status, pending tasks and notifications from one place.",
            icon: Icons.dashboard_outlined,
          ),

          GuideStepModel(
            step: 3,
            title: "Orders",
            description:
            "Open the Orders section to view new customer orders. Review the order details and start processing.",
            icon: Icons.shopping_bag_outlined,
          ),

          GuideStepModel(
            step: 4,
            title: "Animal Verification",
            description:
            "Scan the animal QR code and verify that the displayed details match the assigned animal before processing.",
            icon: Icons.qr_code_scanner,
          ),

          GuideStepModel(
            step: 5,
            title: "Inventory",
            description:
            "Keep your inventory updated by adding, editing or removing available animals.",
            icon: Icons.inventory_2_outlined,
          ),

          GuideStepModel(
            step: 6,
            title: "Time Slots",
            description:
            "Create and manage available slaughter slots so customers can book appointments.",
            icon: Icons.schedule_outlined,
          ),

          GuideStepModel(
            step: 7,
            title: "Complete Orders",
            description:
            "Once processing is finished, mark the order as Completed so the customer is notified.",
            icon: Icons.task_alt,
          ),

          GuideStepModel(
            step: 8,
            title: "Reports",
            description:
            "Monitor Daily Reports, Revenue Reports, Inventory Reports, Tax Reports and Order Reports.",
            icon: Icons.bar_chart_outlined,
          ),

          GuideStepModel(
            step: 9,
            title: "Payouts",
            description:
            "Check your available balance, payout history and request payouts when eligible.",
            icon: Icons.account_balance_wallet_outlined,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/support_help_model.dart';
import 'support_help_event.dart';
import 'support_help_state.dart';

class SupportHelpBloc
    extends Bloc<SupportHelpEvent, SupportHelpState> {

  SupportHelpBloc()
      : super(
    SupportHelpState(
      items: const [
        SupportItem(
          title: "FAQs",
          icon: Icons.help_outline,
        ),
        SupportItem(
          title: "How to Use App",
          icon: Icons.info_outline,
        ),
        SupportItem(
          title: "Contact Support",
          icon: Icons.support_agent,
        ),
        SupportItem(
          title: "Live Chat",
          subtitle: "Available 24/7",
          icon: Icons.phone_in_talk_outlined,
        ),
        SupportItem(
          title: "Report an Issue",
          icon: Icons.report_problem_outlined,
        ),
      ],
    ),
  ) {

    on<LoadSupportItems>((event, emit) {
      // Nothing to load for now
    });

    on<SupportItemTapped>((event, emit) {
      // Navigation later
    });

    on<CallSupport>((event, emit) {
      // Call functionality later
    });
  }
}
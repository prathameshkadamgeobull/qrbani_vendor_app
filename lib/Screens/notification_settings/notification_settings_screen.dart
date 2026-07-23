import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/notification_settings/notification_settings_bloc.dart';
import '../../blocs/features/notification_settings/notification_settings_state.dart';

import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/notification_header.dart';
import 'widgets/enable_notification_card.dart';
import 'widgets/notification_preference_card.dart';
import 'widgets/quiet_hours_card.dart';
import 'widgets/additional_settings_card.dart';
import 'widgets/privacy_card.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationSettingsBloc(),
      child: const _NotificationSettingsView(),
    );
  }
}

class _NotificationSettingsView extends StatelessWidget {
  const _NotificationSettingsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      body: SafeArea(
        child: BlocBuilder<
            NotificationSettingsBloc,
            NotificationSettingsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Column(
                children: [

                  /// Header
                  const NotificationHeader(),

                  const SizedBox(height: 20),

                  /// Enable Notifications
                  EnableNotificationCard(state: state),

                  const SizedBox(height: 20),

                  /// Notification Preferences
                  NotificationPreferenceCard(state: state),

                  const SizedBox(height: 20),

                  /// Quiet Hours
                  QuietHoursCard(state: state),

                  const SizedBox(height: 20),

                  /// Additional Settings
                  AdditionalSettingsCard(state: state),

                  const SizedBox(height: 20),

                  /// Privacy Card
                  const PrivacyCard(),

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
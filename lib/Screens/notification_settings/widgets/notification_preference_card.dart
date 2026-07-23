import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/notification_settings/notification_settings_bloc.dart';
import '../../../blocs/features/notification_settings/notification_settings_event.dart';
import '../../../blocs/features/notification_settings/notification_settings_state.dart';

import 'notification_tile.dart';

class NotificationPreferenceCard extends StatelessWidget {
  final NotificationSettingsState state;

  const NotificationPreferenceCard({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 12),
            child: Text(
              "NOTIFICATION PREFERENCES",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Color(0xff9CA3AF),
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.04),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                NotificationTile(
                  icon: Icons.shopping_bag_outlined,
                  iconBackground: const Color(0xffEEF4FF),
                  iconColor: const Color(0xff2563EB),
                  title: "Order Updates",
                  subtitle: "Status changes and delivery updates",
                  value: state.orderUpdates,
                  onChanged: (value) {
                    context.read<NotificationSettingsBloc>().add(
                      ToggleOrderUpdates(value),
                    );
                  },
                ),

                Divider(height: 1, color: Colors.grey.shade200),

                NotificationTile(
                  icon: Icons.calendar_today_outlined,
                  iconBackground: const Color(0xffFEF3E7),
                  iconColor: const Color(0xffF59E0B),
                  title: "Booking Reminders",
                  subtitle: "Appointment reminders and confirmations",
                  value: state.bookingReminders,
                  onChanged: (value) {
                    context.read<NotificationSettingsBloc>().add(
                      ToggleBookingReminders(value),
                    );
                  },
                ),

                Divider(height: 1, color: Colors.grey.shade200),

                NotificationTile(
                  icon: Icons.account_balance_wallet_outlined,
                  iconBackground: const Color(0xffECFDF3),
                  iconColor: const Color(0xff10B981),
                  title: "Payout Updates",
                  subtitle: "Payment confirmations and earnings",
                  value: state.payoutUpdates,
                  onChanged: (value) {
                    context.read<NotificationSettingsBloc>().add(
                      TogglePayoutUpdates(value),
                    );
                  },
                ),

                Divider(height: 1, color: Colors.grey.shade200),

                NotificationTile(
                  icon: Icons.warning_amber_rounded,
                  iconBackground: const Color(0xffFEF2F2),
                  iconColor: const Color(0xffEF4444),
                  title: "System Alerts",
                  subtitle: "Important account and security notifications",
                  value: state.systemAlerts,
                  onChanged: (value) {
                    context.read<NotificationSettingsBloc>().add(
                      ToggleSystemAlerts(value),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
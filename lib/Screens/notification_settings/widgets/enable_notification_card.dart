import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/notification_settings/notification_settings_bloc.dart';
import '../../../blocs/features/notification_settings/notification_settings_event.dart';
import '../../../blocs/features/notification_settings/notification_settings_state.dart';

class EnableNotificationCard extends StatelessWidget {
  final NotificationSettingsState state;

  const EnableNotificationCard({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 18,
        ),
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
        child: Row(
          children: [

            /// Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffEDF9F1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                color: Color(0xff22A447),
                size: 30,
              ),
            ),

            const SizedBox(width: 18),

            /// Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [

                  Text(
                    "Enable Notifications",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1F2937),
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Receive important updates and alerts",
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            /// Switch
            Transform.scale(
              scale: 0.90,
              child: Switch(
                value: state.enableNotifications,
                activeColor: Colors.white,
                activeTrackColor: const Color(0xff22C55E),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade300,
                onChanged: (value) {
                  context.read<NotificationSettingsBloc>().add(
                    ToggleEnableNotifications(value),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
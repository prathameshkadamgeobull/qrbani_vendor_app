import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/notification_settings/notification_settings_bloc.dart';
import '../../../blocs/features/notification_settings/notification_settings_event.dart';
import '../../../blocs/features/notification_settings/notification_settings_state.dart';

class AdditionalSettingsCard extends StatelessWidget {
  final NotificationSettingsState state;

  const AdditionalSettingsCard({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 6, bottom: 14),
            child: Text(
              "ADDITIONAL SETTINGS",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
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
                _AdditionalTile(
                  icon: Icons.vibration,
                  iconColor: const Color(0xff8B5CF6),
                  iconBackground: const Color(0xffF3E8FF),
                  title: "Vibration",
                  subtitle: "Vibrate for notifications",
                  value: state.vibration,
                  onChanged: (value) {
                    context.read<NotificationSettingsBloc>().add(
                      ToggleVibration(value),
                    );
                  },
                ),

                Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                ),

                _AdditionalTile(
                  icon: Icons.volume_up_outlined,
                  iconColor: const Color(0xffF59E0B),
                  iconBackground: const Color(0xffFEF3E7),
                  title: "Sound",
                  subtitle: "Play notification sounds",
                  value: state.sound,
                  onChanged: (value) {
                    context.read<NotificationSettingsBloc>().add(
                      ToggleSound(value),
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

class _AdditionalTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  final String title;
  final String subtitle;

  final bool value;

  final ValueChanged<bool> onChanged;

  const _AdditionalTile({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 18,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 26,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff111827),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff6B7280),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          Transform.scale(
            scale: 0.90,
            child: Switch(
              value: value,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xff22C55E),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade300,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
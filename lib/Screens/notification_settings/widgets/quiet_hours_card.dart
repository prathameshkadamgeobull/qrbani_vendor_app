import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/notification_settings/notification_settings_bloc.dart';
import '../../../blocs/features/notification_settings/notification_settings_event.dart';
import '../../../blocs/features/notification_settings/notification_settings_state.dart';

class QuietHoursCard extends StatelessWidget {
  final NotificationSettingsState state;

  const QuietHoursCard({
    super.key,
    required this.state,
  });

  Future<void> _selectTime(
      BuildContext context, {
        required bool isStart,
      }) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isStart ? state.quietStart : state.quietEnd,
    );

    if (picked != null) {
      context.read<NotificationSettingsBloc>().add(
        UpdateQuietHours(
          start: isStart ? picked : state.quietStart,
          end: isStart ? state.quietEnd : picked,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 6, bottom: 14),
            child: Text(
              "NOTIFICATION TIMING",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                color: Color(0xff9CA3AF),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3E8FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.nightlight_round,
                    color: Color(0xff8B5CF6),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Quiet Hours",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff111827),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Pause non-urgent notifications during these hours",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.4,
                          color: Color(0xff6B7280),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: _TimeBox(
                              label: "Start",
                              time: state.quietStart.format(context),
                              onTap: () => _selectTime(
                                context,
                                isStart: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _TimeBox(
                              label: "End",
                              time: state.quietEnd.format(context),
                              onTap: () => _selectTime(
                                context,
                                isStart: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeBox extends StatelessWidget {
  final String label;
  final String time;
  final VoidCallback onTap;

  const _TimeBox({
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xffE5E7EB),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff9CA3AF),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 10,
                  color: Color(0xff6B7280),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff111827),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
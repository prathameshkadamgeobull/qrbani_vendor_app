import 'package:flutter/material.dart';
import '../../../models/time_slot_model.dart';

class TimeSlotCard extends StatelessWidget {
  final TimeSlotModel slot;

  const TimeSlotCard({
    super.key,
    required this.slot,
  });

  @override
  Widget build(BuildContext context) {
    final int safeBooked =
    slot.booked > slot.capacity ? slot.capacity : slot.booked;

    final double percent = slot.capacity == 0
        ? 0
        : (safeBooked / slot.capacity).clamp(0.0, 1.0);

    Color barColor;

    if (slot.booked >= slot.capacity) {
      // Full
      barColor = const Color(0xffE53935);
    } else if (percent >= 0.90) {
      // Almost Full
      barColor = const Color(0xffF5A623);
    } else {
      // Available
      barColor = const Color(0xff19A55A);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffE8E8E8),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          /// Left Side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slot.time,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Capacity: ${slot.capacity}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff666666),
                  ),
                ),
              ],
            ),
          ),

          /// Right Side
          SizedBox(
            width: 100,
            child: Container(
              height: 22,
              decoration: BoxDecoration(
                color: const Color(0xffEAEAEA),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  /// Colored Progress
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: barColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  /// Center Text
                  Center(
                    child: Text(
                      safeBooked >= slot.capacity
                          ? "$safeBooked/${slot.capacity} Full"
                          : "$safeBooked/${slot.capacity} Booked",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
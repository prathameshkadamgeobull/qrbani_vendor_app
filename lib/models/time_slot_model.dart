class TimeSlotModel {
  final String time;
  final int capacity;
  final int booked;
  final bool isFull;

  const TimeSlotModel({
    required this.time,
    required this.capacity,
    required this.booked,
    required this.isFull,
  });

  int get available => capacity - booked;
}
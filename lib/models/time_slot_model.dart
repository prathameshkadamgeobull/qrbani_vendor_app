class TimeSlotModel {

  final String date;
  final String time;
  final int capacity;
  final int booked;
  final bool isFull;


  const TimeSlotModel({

    required this.date,

    required this.time,

    required this.capacity,

    required this.booked,

    required this.isFull,

  });


  int get available {
    final value = capacity - booked;
    return value < 0 ? 0 : value;
  }
}
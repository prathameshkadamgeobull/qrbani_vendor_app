abstract class LiveVideoState {}

class LiveVideoLoading extends LiveVideoState {}

class LiveVideoLoaded extends LiveVideoState {
  final bool muted;
  final bool speakerOn;

  /// Timer in seconds
  final int liveSeconds;

  /// Order Details
  final String orderId;
  final String customerName;
  final String animalType;
  // final String weight;
  final String status;

  LiveVideoLoaded({
    required this.muted,
    required this.speakerOn,
    required this.liveSeconds,
    required this.orderId,
    required this.customerName,
    required this.animalType,
    // required this.weight,
    required this.status,
  });
}
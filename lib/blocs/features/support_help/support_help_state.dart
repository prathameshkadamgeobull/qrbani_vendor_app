import '../../../models/support_help_model.dart';

class SupportHelpState {
  final List<SupportItem> items;
  final int? navigateIndex;

  const SupportHelpState({
    required this.items,
    this.navigateIndex,
  });

  SupportHelpState copyWith({
    List<SupportItem>? items,
    int? navigateIndex,
  }) {
    return SupportHelpState(
      items: items ?? this.items,
      navigateIndex: navigateIndex,
    );
  }
}
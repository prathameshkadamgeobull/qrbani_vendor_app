abstract class SupportHelpEvent {}

class LoadSupportItems extends SupportHelpEvent {}

class SupportItemTapped extends SupportHelpEvent {
  final int index;

  SupportItemTapped(this.index);

  @override
  List<Object?> get props => [index];
}

class CallSupport extends SupportHelpEvent {}
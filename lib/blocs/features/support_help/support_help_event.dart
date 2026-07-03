abstract class SupportHelpEvent {}

class LoadSupportItems extends SupportHelpEvent {}

class SupportItemTapped extends SupportHelpEvent {
  final int index;

  SupportItemTapped(this.index);
}

class CallSupport extends SupportHelpEvent {}
abstract class DrawerState {}

class DrawerInitial extends DrawerState {
  final int selectedIndex;

  DrawerInitial(this.selectedIndex);
}
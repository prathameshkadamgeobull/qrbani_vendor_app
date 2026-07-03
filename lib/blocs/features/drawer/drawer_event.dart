abstract class DrawerEvent {}

class ChangeDrawerItem extends DrawerEvent {
  final int index;

  ChangeDrawerItem(this.index);
}
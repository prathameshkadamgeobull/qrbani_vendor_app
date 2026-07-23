abstract class DrawerEvent {}

class ChangeDrawerItem extends DrawerEvent {
  final int index;

  ChangeDrawerItem(this.index);
}

// abstract class DrawerEvent {}
//
// class SelectDrawerMenu extends DrawerEvent {
//   final int index;
//
//   SelectDrawerMenu(this.index);
// }
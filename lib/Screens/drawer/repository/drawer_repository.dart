import '../../../models/drawer_menu_model.dart';

class DrawerRepository {

  List<DrawerMenuModel> getMenus() {
    return [
      DrawerMenuModel(title: "Dashboard", route: "/dashboard"),
      DrawerMenuModel(title: "Orders", route: "/orders"),
      DrawerMenuModel(title: "Inventory", route: "/inventory"),
      DrawerMenuModel(title: "Time Slots", route: "/timeSlots"),
      DrawerMenuModel(title: "Reports", route: "/reports"),
      DrawerMenuModel(title: "Payouts", route: "/payouts"),
      DrawerMenuModel(title: "Transactions", route: "/transactions"),
      DrawerMenuModel(title: "Notifications", route: "/notifications"),
      DrawerMenuModel(title: "Settings", route: "/settings"),
      DrawerMenuModel(title: "Support", route: "/support"),
    ];
  }
}
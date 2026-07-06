import 'package:flutter/material.dart';
import '../../../models/drawer_menu_model.dart';

class DrawerRepository {
  List<DrawerMenuModel> getMenus() {
    return [
      DrawerMenuModel(
        title: "Dashboard",
        route: "/dashboard",
        icon: Icons.dashboard_outlined,
      ),
      DrawerMenuModel(
        title: "Orders",
        route: "/orders",
        icon: Icons.shopping_bag_outlined,
      ),
      DrawerMenuModel(
        title: "Inventory",
        route: "/inventory",
        icon: Icons.inventory_2_outlined,
      ),
      DrawerMenuModel(
        title: "Time Slots",
        route: "/timeSlots",
        icon: Icons.access_time_outlined,
      ),
      DrawerMenuModel(
        title: "Reports",
        route: "/reports",
        icon: Icons.receipt_long_outlined,
      ),
      DrawerMenuModel(
        title: "Payouts",
        route: "/payouts",
        icon: Icons.account_balance_wallet_outlined,
      ),
      DrawerMenuModel(
        title: "Transactions",
        route: "/transactions",
        icon: Icons.swap_horiz_outlined,
      ),
      DrawerMenuModel(
        title: "Notifications",
        route: "/notifications",
        icon: Icons.notifications_none_outlined,
      ),
      DrawerMenuModel(
        title: "Settings",
        route: "/settings",
        icon: Icons.settings_outlined,
      ),
      DrawerMenuModel(
        title: "Support",
        route: "/support",
        icon: Icons.support_agent_outlined,
      ),
    ];
  }
}
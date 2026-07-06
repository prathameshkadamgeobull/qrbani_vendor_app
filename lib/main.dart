import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/ai_capacity_planner_status/widgets/ai_capacity_planner_screen.dart';
import 'package:qrbani_vender_app/Screens/performance_score/widgets/performance_score_screen.dart';
import 'package:qrbani_vender_app/blocs/features/ai_capacity_planner/ai_capacity_planner_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/animal_verification/animal_verification_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/drawer/drawer_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/performance_score/performance_score_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/live_video/live_video_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/profile/profile_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/reports/reports_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/settings/settings_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/time_slot/time_slot_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/upcoming_orders/upcoming_orders_bloc.dart';

import 'Screens/dashboard/dashboard_screen.dart';
import 'Screens/inventory/inventory_screen.dart';
import 'Screens/live_video/live_video_page.dart';
import 'Screens/notifications/notifications_screen.dart';
import 'Screens/orders/orders_screen.dart';
import 'Screens/payout/payout_screen.dart';
import 'Screens/profile/profile_page.dart';
import 'Screens/profile/repository/profile_repository.dart';
import 'Screens/reports/reports_screen.dart';
import 'Screens/support_help/widgets/support_help_screen.dart';
import 'Screens/settings/settings_screen.dart';
import 'Screens/time_slot/time_slot_screen.dart';
import 'Screens/transaction_history/transaction_history_page.dart';
import 'blocs/features/inventory/inventory_bloc.dart';
import 'blocs/features/notifications/notification_bloc.dart';
import 'blocs/features/orders/orders_bloc.dart';
import 'blocs/features/payout/payout_bloc.dart';
import 'blocs/features/splash/splash_bloc.dart';
import 'blocs/features/login/login_bloc.dart';
import 'blocs/features/register/register_bloc.dart';
import 'blocs/features/dashboard/dashboard_bloc.dart';
import 'blocs/features/bottom_nav/bottom_nav_bloc.dart';

import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<SplashBloc>(
          create: (_) => SplashBloc(),
        ),

        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),

        BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(),
        ),

        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(),
        ),

        BlocProvider<BottomNavBloc>(
          create: (_) => BottomNavBloc(),
        ),
        BlocProvider(
          create: (_) => OrdersBloc(),
        ),
        BlocProvider<UpcomingOrdersBloc>(
          create: (_) => UpcomingOrdersBloc(),
        ),
        BlocProvider(
            create: (_) => AnimalVerificationBloc(),
        ),
        BlocProvider(
          create: (_) => InventoryBloc(),
        ),
        BlocProvider(
          create: (_) => TimeSlotBloc(),
        ),
        BlocProvider(
            create: (_) => DrawerBloc(),
        ),
        BlocProvider(
          create: (_) => PayoutBloc(),
        ),
        BlocProvider(
          create: (_) => ReportsBloc(),
        ),
        BlocProvider(
          create: (_) => NotificationBloc(),
        ),
        BlocProvider(
// <<<<<<< HEAD
            create:(_)=> AICapacityPlannerBloc(),
        ),
        BlocProvider(
            create:(_) =>PerformanceScoreBloc(),
        ),
            BlocProvider(
            create: (_) => SettingsBloc(),
        ),
          BlocProvider(
          create: (_) => ProfileBloc(ProfileRepository()),
        child: const ProfilePage(),
          ),
        BlocProvider(
          create: (_) => LiveVideoBloc(),
          child: const LiveVideoPage(),
        ),

      ],


       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Qrbani Vendor",

          theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: const Color(0xffF5F5F5),
            useMaterial3: true,
          ),

          home: const SplashScreen(),

          routes: {
            "/dashboard": (context) => const DashboardScreen(),
            "/orders": (context) => const OrdersScreen(),
            "/inventory": (context) => const InventoryScreen(),
            "/timeSlots": (context) => const TimeSlotScreen(),
            "/reports": (context) => const ReportsScreen(),
             "/payouts": (context) => const PayoutScreen(),
             "/transactions": (context) => const TransactionHistoryPage(),
             "/notifications": (context) => const NotificationsScreen(),
             "/settings": (context) => const SettingsScreen(),
            "/support": (context) => const SupportHelpPage(),

             "/settings": (context) => const SettingsScreen(),
            // "/support": (context) => const SupportScreen(),
          },
        ),
    );
  }
}
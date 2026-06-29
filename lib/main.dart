import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/upcoming_orders/upcoming_orders_bloc.dart';

import 'blocs/features/orders/orders_bloc.dart';
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
        )

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
      ),
    );
  }
}
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  import '../../Core/constants/app_colors.dart';
  import '../../Core/constants/app_images.dart';
  import '../../Core/constants/app_strings.dart';
import '../../blocs/features/splash/splash_bloc.dart';
import '../../blocs/features/splash/splash_event.dart';
import '../../blocs/features/splash/splash_state.dart';
import '../login/login_screen.dart';

  class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    State<SplashScreen> createState() =>
        _SplashScreenState();
  }

  class _SplashScreenState
      extends State<SplashScreen> {

    @override
    void initState() {
      super.initState();

      context.read<SplashBloc>()
          .add(StartSplash());
    }

    @override
    Widget build(BuildContext context) {

      return BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {

          if (state is SplashCompleted) {

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
            );
          }
        },

        child: Scaffold(
          backgroundColor: const Color(0xFF0A2A22),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              color: AppColors.primary,
              child: Column(
                children: [

                  const Spacer(flex: 2),

                  Image.asset(
                    "assets/images/slapsh.png",
                    height: MediaQuery.of(context).size.height * 0.80 ,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(flex: 3),

                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "© 2026 Qurbani Platform",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
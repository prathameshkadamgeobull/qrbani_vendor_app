import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/settings/widgets/logout_tile.dart';
import 'package:qrbani_vender_app/Screens/settings/widgets/settings_tile.dart';

import '../../blocs/features/bank_details/bank_details_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../../blocs/features/business_information/business_information_bloc.dart';
import '../../blocs/features/drawer/drawer_bloc.dart';
import '../../blocs/features/drawer/drawer_event.dart';
import '../../blocs/features/notification_settings/notification_settings_bloc.dart';
import '../../blocs/features/settings/settings_bloc.dart';
import '../../blocs/features/settings/settings_event.dart';
import '../../blocs/features/settings/settings_state.dart';
import '../../screens/login/login_screen.dart';
import '../bank_details/bank_details_screen.dart';
import '../bank_details/repositories/bank_details_repository.dart';
import '../business_information/business_information_screen.dart';
import '../business_information/repositories/business_information_repository.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';
import '../notification_settings/notification_settings_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(LoadSettings());
  }
  void _showLanguageSheet(BuildContext context, String selectedLanguage) {
    final languages = [
      {"name": "English", "code": "en"},
      {"name": "हिन्दी", "code": "hi"},
      {"name": "اردو", "code": "ur"},
      {"name": "العربية", "code": "ar-SA"},
      {"name": "বাংলা", "code": "ar-AE"},
      {"name": "Português", "code": "ar-EG"},
      {"name": "Français", "code": "fr"},
      {"name": "Español", "code": "es"},
      {"name": "Deutsch", "code": "de"},
      {"name": "Türkçe", "code": "tr"},
      {"name": "Bahasa Indonesia", "code": "id"},
      {"name": "Italiano", "code": "zh-CN"},
      ];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final lang = languages[index];

            return ListTile(
              leading: const Icon(Icons.language),
              title: Text(lang["name"]!),
              trailing: selectedLanguage == lang["name"]
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                context.read<SettingsBloc>().add(
                  ChangeLanguage(lang["name"]!),
                );

                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar:AppBar(
    title: const Text("Settings"),
    centerTitle: true,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
    // Update Bottom Navigation to Dashboard
    context.read<BottomNavBloc>().add(
    ChangeTabEvent(0),
    );

    // Update Drawer Selection to Dashboard
    context.read<DrawerBloc>().add(
    ChangeDrawerItem(0),
    );

    Navigator.pushNamedAndRemoveUntil(
    context,
    "/dashboard",
    (route) => false,
    );
    },
    ),
    ),

      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {

          String language = "English";

          if (state is SettingsLoaded) {
            language = state.language;
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [

              SettingsTile(
                icon: Icons.business,
                title: "Business Information",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => BusinessInformationBloc(
                          BusinessInformationRepository(),
                        ),
                        child: const BusinessInformationScreen(),
                      ),
                    ),
                  );
                },
              ),

              SettingsTile(
                icon: Icons.account_balance,
                title: "Bank Details",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => BankDetailsBloc(
                          BankDetailsRepository(),
                        ),
                        child: const BankDetailsScreen(),
                      ),
                    ),
                  );
                },
              ),

              SettingsTile(
                icon: Icons.notifications,
                title: "Notification Settings",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => NotificationSettingsBloc(),
                        child: const NotificationSettingsScreen(),
                      ),
                    ),
                  );
                },
              ),

              SettingsTile(
                icon: Icons.language,
                title: "Language",
                subtitle: language,
                onTap: () {
                  _showLanguageSheet(context, language);
                },
              ),

              // SettingsTile(
              //   icon: Icons.lock,
              //   title: "Change Password",
              //   onTap: () {},
              // ),

          const SizedBox(height: 20),

          LogoutTile(
          onTap: () async {
    final logout = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
    return Dialog(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
    ),
    child: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Container(
    height: 70,
    width: 70,
    decoration: const BoxDecoration(
    color: Color(0xffEAF7F0),
    shape: BoxShape.circle,
    ),
    child: const Icon(
    Icons.logout_rounded,
    size: 36,
    color: Color(0xff0B8A47),
    ),
    ),

    const SizedBox(height: 20),

    const Text(
    "Logout",
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    ),
    ),

    const SizedBox(height: 12),

    const Text(
    "Are you sure you want to logout?\nYou'll need to login again to continue.",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 15,
    color: Colors.grey,
    height: 1.5,
    ),
    ),

    const SizedBox(height: 28),

    Row(
    children: [
    Expanded(
    child: OutlinedButton(
    onPressed: () {
    Navigator.pop(context, false);
    },
    style: OutlinedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    side: const BorderSide(
    color: Color(0xff0B8A47),
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14),
    ),
    ),
    child: const Text(
    "Cancel",
    style: TextStyle(
    color: Color(0xff0B8A47),
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    ),

    const SizedBox(width: 14),

    Expanded(
    child: ElevatedButton(
    onPressed: () {
    Navigator.pop(context, true);
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff0B8A47),
    foregroundColor: Colors.white,
    minimumSize: const Size.fromHeight(50),
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14),
    ),
    ),
    child: const Text(
    "Logout",
    style: TextStyle(
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );
    },
    );

    if (logout == true) {
      context.read<SettingsBloc>().add(
        LogoutPressed(),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
            (route) => false,
      );
    }
          },
          ),

            ],
          );
        },
      ),

      bottomNavigationBar: const CustomBottomNavigation(),

    );
  }
}
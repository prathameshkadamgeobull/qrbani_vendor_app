import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/settings/widgets/logout_tile.dart';
import 'package:qrbani_vender_app/Screens/settings/widgets/settings_tile.dart';

import '../../blocs/features/settings/settings_bloc.dart';
import '../../blocs/features/settings/settings_event.dart';
import '../../blocs/features/settings/settings_state.dart';

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
      {"name": "Hindi", "code": "hi"},
      {"name": "Urdu", "code": "ur"},
      {"name": "Arabic (Saudi Arabia)", "code": "ar-SA"},
      {"name": "Arabic (UAE)", "code": "ar-AE"},
      {"name": "Arabic (Egypt)", "code": "ar-EG"},
      {"name": "French", "code": "fr"},
      {"name": "Spanish", "code": "es"},
      {"name": "German", "code": "de"},
      {"name": "Turkish", "code": "tr"},
      {"name": "Indonesian", "code": "id"},
      {"name": "Chinese (Simplified)", "code": "zh-CN"},
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
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
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
                onTap: () {},
              ),

              SettingsTile(
                icon: Icons.account_balance,
                title: "Bank Details",
                onTap: () {},
              ),

              SettingsTile(
                icon: Icons.notifications,
                title: "Notification Settings",
                onTap: () {},
              ),

              SettingsTile(
                icon: Icons.language,
                title: "Language",
                subtitle: language,
                onTap: () {
                  _showLanguageSheet(context, language);
                },
              ),

              SettingsTile(
                icon: Icons.lock,
                title: "Change Password",
                onTap: () {},
              ),

              const SizedBox(height: 20),

              LogoutTile(
                onTap: () {
                  context.read<SettingsBloc>().add(LogoutPressed());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
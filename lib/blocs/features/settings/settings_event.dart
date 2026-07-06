abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class LogoutPressed extends SettingsEvent {}

class ChangeLanguage extends SettingsEvent {
  final String language;
  ChangeLanguage(this.language);
}
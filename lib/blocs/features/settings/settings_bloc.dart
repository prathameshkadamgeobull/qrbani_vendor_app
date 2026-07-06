import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<LoadSettings>(_onLoad);
    on<LogoutPressed>(_onLogout);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  void _onLoad(LoadSettings event, Emitter emit) {
    emit(SettingsLoaded(language: "English"));
  }

  void _onLogout(LogoutPressed event, Emitter emit) {
    emit(SettingsLoggedOut());
  }

  void _onChangeLanguage(ChangeLanguage event, Emitter emit) {
    emit(SettingsLoaded(language: event.language));
  }
}
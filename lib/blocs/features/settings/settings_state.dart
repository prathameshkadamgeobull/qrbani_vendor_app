abstract class SettingsState {
  const SettingsState();
}

/// Initial State
class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

/// Loading State
class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

/// Loaded State
class SettingsLoaded extends SettingsState {
  final String language;

  const SettingsLoaded({
    required this.language,
  });

  SettingsLoaded copyWith({
    String? language,
  }) {
    return SettingsLoaded(
      language: language ?? this.language,
    );
  }
}

/// Logout State
class SettingsLoggedOut extends SettingsState {
  const SettingsLoggedOut();
}

/// Error State (Optional but Recommended)
class SettingsError extends SettingsState {
  final String message;

  const SettingsError({
    required this.message,
  });
}
abstract class LiveVideoEvent {}

class LoadLiveVideo extends LiveVideoEvent {}

class ToggleMute extends LiveVideoEvent {}

class ToggleSpeaker extends LiveVideoEvent {}

class UpdateLiveTimer extends LiveVideoEvent {}

class EndLiveVideo extends LiveVideoEvent {}
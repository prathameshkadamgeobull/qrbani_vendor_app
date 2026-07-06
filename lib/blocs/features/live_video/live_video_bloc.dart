import 'package:flutter_bloc/flutter_bloc.dart';

import 'live_video_event.dart';
import 'live_video_state.dart';

class LiveVideoBloc extends Bloc<LiveVideoEvent, LiveVideoState> {
  bool muted = false;
  bool speaker = true;

  int liveSeconds = 0;

  final String orderId = "QB-2024-0001258";
  final String customerName = "Mohammed Khan";
  final String animalType = "Goat";
  // final String weight = "45 Kg";
  final String status = "LIVE";

  LiveVideoBloc() : super(LiveVideoLoading()) {
    on<LoadLiveVideo>(_onLoadLiveVideo);

    on<ToggleMute>(_onToggleMute);

    on<ToggleSpeaker>(_onToggleSpeaker);

    on<UpdateLiveTimer>(_onUpdateLiveTimer);

    on<EndLiveVideo>(_onEndLiveVideo);
  }

  void _emitLoaded(Emitter<LiveVideoState> emit) {
    emit(
      LiveVideoLoaded(
        muted: muted,
        speakerOn: speaker,
        liveSeconds: liveSeconds,
        orderId: orderId,
        customerName: customerName,
        animalType: animalType,
        // weight: weight,
        status: status,
      ),
    );
  }

  void _onLoadLiveVideo(
      LoadLiveVideo event,
      Emitter<LiveVideoState> emit,
      ) {
    liveSeconds = 0;

    _emitLoaded(emit);
  }

  void _onToggleMute(
      ToggleMute event,
      Emitter<LiveVideoState> emit,
      ) {
    muted = !muted;

    _emitLoaded(emit);
  }

  void _onToggleSpeaker(
      ToggleSpeaker event,
      Emitter<LiveVideoState> emit,
      ) {
    speaker = !speaker;

    _emitLoaded(emit);
  }

  void _onUpdateLiveTimer(
      UpdateLiveTimer event,
      Emitter<LiveVideoState> emit,
      ) {
    liveSeconds++;

    _emitLoaded(emit);
  }

  void _onEndLiveVideo(
      EndLiveVideo event,
      Emitter<LiveVideoState> emit,
      ) {
    liveSeconds = 0;

    emit(LiveVideoLoading());
  }
}
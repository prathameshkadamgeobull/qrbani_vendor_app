import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/live_video/live_video_bloc.dart';
import '../../../blocs/features/live_video/live_video_event.dart';
import 'control_button.dart';

class LiveVideoControls extends StatefulWidget {
  final bool muted;
  final bool speakerOn;
  final VoidCallback onSwitchCamera;

  const LiveVideoControls({
    super.key,
    required this.muted,
    required this.speakerOn,
    required this.onSwitchCamera,
  });

  @override
  State<LiveVideoControls> createState() => _LiveVideoControlsState();
}

class _LiveVideoControlsState extends State<LiveVideoControls> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// Mute
          ControlButton(
            icon: widget.muted ? Icons.mic_off : Icons.mic,
            title: widget.muted ? "Unmute" : "Mute",
            backgroundColor: const Color(0xff3A3A3A),
            onTap: () {
              context.read<LiveVideoBloc>().add(
                ToggleMute(),
              );
            },
          ),

          /// Speaker
          ControlButton(
            icon: widget.speakerOn
                ? Icons.volume_up
                : Icons.volume_off,
            title: "Speaker",
            backgroundColor: const Color(0xff3A3A3A),
            onTap: () {
              context.read<LiveVideoBloc>().add(
                ToggleSpeaker(),
              );
            },
          ),

          /// Switch Camera
          ControlButton(
            icon: Icons.flip_camera_android,
            title: "Camera",
            backgroundColor: const Color(0xff3A3A3A),
            onTap: widget.onSwitchCamera,
          ),

          /// End
          ControlButton(
            icon: Icons.call_end,
            title: "End",
            backgroundColor: Colors.red,
            onTap: () {
              context.read<LiveVideoBloc>().add(
                EndLiveVideo(),
              );

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
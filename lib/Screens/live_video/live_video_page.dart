import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/live_video/live_video_bloc.dart';
import '../../blocs/features/live_video/live_video_event.dart';
import '../../blocs/features/live_video/live_video_state.dart';

import 'widgets/live_video_controls.dart';
import 'widgets/live_video_header.dart';
import 'widgets/live_video_info_card.dart';

class LiveVideoPage extends StatefulWidget {
  const LiveVideoPage({super.key});

  @override
  State<LiveVideoPage> createState() => _LiveVideoPageState();
}

class _LiveVideoPageState extends State<LiveVideoPage> {
  bool showDetails = false;

  CameraController? _cameraController;

  bool cameraReady = false;

  bool isFrontCamera = true;

  Timer? timer;

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        debugPrint("No Camera Found");
        return;
      }

      CameraDescription selectedCamera = cameras.first;

      for (final camera in cameras) {
        if (camera.lensDirection ==
            (isFrontCamera
                ? CameraLensDirection.front
                : CameraLensDirection.back)) {
          selectedCamera = camera;
          break;
        }
      }

      _cameraController = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: true,
      );

      await _cameraController!.initialize();

      if (!mounted) return;

      setState(() {
        cameraReady = true;
      });
    } catch (e) {
      debugPrint("Camera Error : $e");
    }
  }

  Future<void> switchCamera() async {
    try {
      isFrontCamera = !isFrontCamera;

      cameraReady = false;
      setState(() {});

      await _cameraController?.dispose();

      await initializeCamera();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    context.read<LiveVideoBloc>().add(
      LoadLiveVideo(),
    );

    initializeCamera();

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (_) {
        context.read<LiveVideoBloc>().add(
          UpdateLiveTimer(),
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<LiveVideoBloc, LiveVideoState>(
        builder: (context, state) {
          if (state is LiveVideoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LiveVideoLoaded) {
            return SafeArea(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDetails = !showDetails;
                  });
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: cameraReady &&
                          _cameraController != null &&
                          _cameraController!.value.isInitialized
                          ? CameraPreview(_cameraController!)
                          : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    LiveVideoHeader(
                      seconds: state.liveSeconds,
                    ),

                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 30,
                      child: LiveVideoControls(
                        muted: state.muted,
                        speakerOn: state.speakerOn,
                        onSwitchCamera: switchCamera,
                      ),
                    ),

                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      left: 16,
                      right: 16,
                      bottom: showDetails ? 140 : -320,
                      child: LiveVideoInfoCard(
                        orderId: state.orderId,
                        customer: state.customerName,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
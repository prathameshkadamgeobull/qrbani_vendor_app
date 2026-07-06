import 'package:flutter_bloc/flutter_bloc.dart';

import 'qr_scanner_event.dart';
import 'qr_scanner_state.dart';

class QRScannerBloc extends Bloc<QRScannerEvent, QRScannerState> {
  bool flashOn = false;

  QRScannerBloc() : super(QRScannerInitial()) {

    on<StartScanner>((event, emit) {
      emit(QRScannerRunning(flashOn: flashOn));
    });

    on<ToggleFlash>((event, emit) {
      flashOn = !flashOn;
      emit(QRScannerRunning(flashOn: flashOn));
    });

    // ADD THIS
    on<PickFromGallery>((event, emit) {
      // No state change required for now.
    });

    on<QRCodeDetected>((event, emit) {
      emit(QRScannerSuccess(event.qrCode));
    });

    on<StopScanner>((event, emit) {
      emit(QRScannerInitial());
    });
  }
}
abstract class QRScannerState {}

class QRScannerInitial extends QRScannerState {}

class QRScannerRunning extends QRScannerState {
  final bool flashOn;

  QRScannerRunning({
    required this.flashOn,
  });
}

class QRScannerSuccess extends QRScannerState {
  final String qrCode;

  QRScannerSuccess(this.qrCode);
}
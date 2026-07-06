abstract class QRScannerEvent {}

class StartScanner extends QRScannerEvent {}

class StopScanner extends QRScannerEvent {}

class ToggleFlash extends QRScannerEvent {}

class PickFromGallery extends QRScannerEvent {}

class QRCodeDetected extends QRScannerEvent {
  final String qrCode;

  QRCodeDetected(this.qrCode);
}
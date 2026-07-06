class QRScannerRepository {
  Future<String> scanResult(String qrCode) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return qrCode;
  }
}
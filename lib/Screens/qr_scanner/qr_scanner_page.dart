import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrbani_vender_app/Screens/qr_scanner/widgets/scanner_bottom_actions.dart';
import 'package:qrbani_vender_app/Screens/qr_scanner/widgets/scanner_header.dart';

import '../../blocs/features/qr_scanner/qr_scanner_bloc.dart';
import '../../blocs/features/qr_scanner/qr_scanner_event.dart';
import '../../blocs/features/qr_scanner/qr_scanner_state.dart';
import 'widgets/scanner_overlay.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final MobileScannerController controller = MobileScannerController();
  bool _isScanned = false;


  @override
  void initState() {
    super.initState();
    context.read<QRScannerBloc>().add(StartScanner());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _toggleFlash() {
    context.read<QRScannerBloc>().add(ToggleFlash());
    controller.toggleTorch();
  }

  Future<void> _openGallery() async {
    context.read<QRScannerBloc>().add(PickFromGallery());

    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;
  }

      @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<QRScannerBloc, QRScannerState>(
        builder: (context, state) {
          return Stack(
            children: [
              /// Camera Preview
              MobileScanner(
                controller: controller,
                onDetect: (capture) async {
                  if (_isScanned) return;

                  final Barcode? barcode =
                  capture.barcodes.isNotEmpty ? capture.barcodes.first : null;

                  final String? code = barcode?.rawValue;

                  if (code == null) return;

                  _isScanned = true;

                  await controller.stop();

                  if (!mounted) return;

                  /// Return scanned QR to previous page
                  Navigator.pop(context, code);
                },
              ),

              /// Scanner Overlay
              const ScannerOverlay(),

              /// Header
              const QRScannerHeader(),

              /// Bottom Buttons
              Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: ScannerBottomAction(
                  onFlash: _toggleFlash,
                  onGallery: _openGallery,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
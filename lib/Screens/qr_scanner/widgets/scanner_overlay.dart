import 'package:flutter/material.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Stack(
          children: [

            /// Top Left
            const Positioned(
              top: 0,
              left: 0,
              child: _Corner(),
            ),

            /// Top Right
            Positioned(
              top: 0,
              right: 0,
              child: Transform.rotate(
                angle: 1.57,
                child: const _Corner(),
              ),
            ),

            /// Bottom Left
            Positioned(
              bottom: 0,
              left: 0,
              child: Transform.rotate(
                angle: -1.57,
                child: const _Corner(),
              ),
            ),

            /// Bottom Right
            Positioned(
              bottom: 0,
              right: 0,
              child: Transform.rotate(
                angle: 3.14,
                child: const _Corner(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Corner extends StatelessWidget {
  const _Corner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff00D26A),
            width: 4,
          ),
          left: BorderSide(
            color: Color(0xff00D26A),
            width: 4,
          ),
        ),
      ),
    );
  }
}
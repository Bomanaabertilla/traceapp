import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trace_app/screens/scan_captured_screen.dart';

// import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanBar extends StatelessWidget {
  final Function(String) onScanned;

  const QrScanBar({super.key, required this.onScanned});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: const RoundedRectDottedBorderOptions(
        radius: Radius.circular(16),
        color: Colors.deepOrangeAccent,
        strokeWidth: 2,
        dashPattern: [10, 8],
      ),
      child: InkWell(
        onTap: () async {
          final scannedCode = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return QrScannerScreen();
              },
            ),
          );

          if (scannedCode != null) {
            onScanned(scannedCode);
          }
        },
        child: Container(
          height: 120,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code, size: 32, color: Colors.deepOrange),

              SizedBox(height: 8),
              Text(
                'Scan QR code',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

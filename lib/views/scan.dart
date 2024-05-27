import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legitcheck/viewmodels/view_Model_QrScan.dart';
import 'package:legitcheck/viewmodels/view_Model_SnackBar.dart';
import 'package:legitcheck/views/snackBar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;
  bool isLoading = false;
  DateTime? lastPressed;

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      String codeString = result?.code ?? '';
      ViewModelQrScan viewModelScan = ViewModelQrScan();
      isLoading = true;
      controller.pauseCamera();
      Future.delayed(Duration(milliseconds: 200), () {
        viewModelScan.resultQrCode(codeString, context, controller);
        setState(() {
          isLoading = false;
          controller.resumeCamera();
        });
      });

      // controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
              lastPressed == null ||
                  now.difference(lastPressed!) > Duration(seconds: 2);

          if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
            lastPressed = now;
            final snack = ShowSnackBar();
            snack.showTopSnackBar(context, 'Press back again to exit');
            return false;
          }
          controller?.pauseCamera();
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              _buildQrView(context),
              if (isLoading)
                CircularProgressIndicator(
                  color: Colors.red, // Warna loader
                ),
            ],
          ),
        ));
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Color.fromARGB(255, 255, 0, 0),
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 300,
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

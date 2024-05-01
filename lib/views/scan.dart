import 'package:flutter/material.dart';
import 'package:legitcheck/views/result_QR_Detail_Product.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'result_qr_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildQrView(context),
          // Positioned(
          //   bottom: 20,
          //   child: result != null
          //       ? Text(
          //           'Barcode hasil scan: ${result!.code}',
          //           style: TextStyle(fontSize: 20),
          //         )
          //       : SizedBox.shrink(),
          // ),
        ],
      ),
    );
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

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      // Jika berhasil mendapatkan data QR, navigasi ke halaman result
      if (result != null && result!.code != null && result!.code!.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (context) => ResultPage(qrData: result!.code!),
            builder: (context) => ResultQrdetailProductPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

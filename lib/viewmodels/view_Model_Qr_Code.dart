import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:legitcheck/models/model_Qr_Code.dart';
import 'package:legitcheck/viewmodels/view_Model_QrScan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class APIConfig {
  static final String baseUrl = 'https://legitcheck.online/api/decryptor';
  static final String token =
      '103|NGpduOqzH2yJ4V1Hr5he2tlDZ98rguffOPFOkavD3fcd6875';
}

class QrRequest {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  QrRequest();

  Future<void> respondQrCode(String result_Scan, BuildContext context,
      QRViewController dataCamera) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: jsonEncode({
          'decrypt': result_Scan,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        dataCamera.pauseCamera();
        final Map<String, dynamic> jsonData = json.decode(response.body);
        QrData qrData = QrData.fromJson(jsonData);

        ViewModelQrScan viewModelScan = ViewModelQrScan();
        viewModelScan.returnQrCode(context, qrData);
      } else {
        print('Error data: ${response.body}');
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}

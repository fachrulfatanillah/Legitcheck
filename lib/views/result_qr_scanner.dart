import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String qrData;

  const ResultPage({Key? key, required this.qrData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Result'),
      ),
      body: Center(
        child: Text(
          qrData,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

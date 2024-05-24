import 'dart:core';
import 'package:flutter/material.dart';
import 'package:legitcheck/models/model_OwnOf_Products.dart';
import 'package:legitcheck/models/model_Qr_Code.dart';
import 'package:legitcheck/models/model_User.dart';
import 'package:legitcheck/viewmodels/view_Model_OwnOf_Products.dart';
import 'package:legitcheck/viewmodels/view_Model_Qr_Code.dart';
import 'package:legitcheck/viewmodels/view_Model_User.dart';
import 'package:legitcheck/views/result_QR_Detail_Product.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ViewModelQrScan extends ChangeNotifier {
  String replaceSpaces(String code) {
    return code.replaceAll(' ', '+');
  }

  Future<void> resultQrCode(
      String data, BuildContext context, QRViewController dataCamera) async {
    if (data != '') {
      QrRequest requestQr = QrRequest();
      requestQr.respondQrCode(replaceSpaces(data), context, dataCamera);
      print(replaceSpaces(data));
    }
  }

  Future<void> returnQrCode(BuildContext context, QrData data) async {
    final ownData = await resultQR(data);
    final listOwn = await listOwnOfProducts(data, context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultQrdetailProductPage(data, ownData, listOwn),
      ),
    );
  }

  Future<List<Map<String, String>>> listOwnOfProducts(
    QrData qrData,
    BuildContext context,
  ) async {
    List<Map<String, String>> owners = [];
    int counter = 1;

    OwnOfProductsGet ownProductsRepository = OwnOfProductsGet();
    UserGet userRepository = UserGet();

    List<User> users = await userRepository.getUsers();
    List<OwnOfProducts> ownProducts =
        await ownProductsRepository.getOwnOfProducts();
    for (var own in ownProducts) {
      if (qrData.decrypted == own.qrcode_id) {
        if (own.status == '1') {
          for (var user in users) {
            if (user.id == own.user_id) {
              owners.add({
                'title': 'Current Owner',
                'email': user.email,
              });
              counter++;
            }
          }
        } else {
          for (var user in users) {
            if (user.id == own.user_id) {
              owners.add({
                'title': _getOrdinalNumber(counter) + ' Owner',
                'email': user.email,
              });
              counter++;
            }
          }
        }
      }
    }
    return owners;
  }

  String _getOrdinalNumber(int number) {
    if (number >= 1 && number <= 20) {
      List<String> ordinalNumbers = [
        'First',
        'Second',
        'Third',
        'Fourth',
        'Fifth',
        'Sixth',
        'Seventh',
        'Eighth',
        'Ninth',
        'Tenth',
        'Eleventh',
        'Twelfth',
        'Thirteenth',
        'Fourteenth',
        'Fifteenth',
        'Sixteenth',
        'Seventeenth',
        'Eighteenth',
        'Nineteenth',
        'Twentieth'
      ];
      return ordinalNumbers[number - 1];
    } else if (number > 20 && number <= 25) {
      List<String> ordinalNumbers = [
        'Twenty-first',
        'Twenty-second',
        'Twenty-third',
        'Twenty-fourth',
        'Twenty-fifth'
      ];
      return ordinalNumbers[number - 21];
    } else {
      return number.toString();
    }
  }

  Future<bool> resultQR(QrData qrData) async {
    OwnOfProductsGet ownProductsRepository = OwnOfProductsGet();
    List<OwnOfProducts> ownProducts =
        await ownProductsRepository.getOwnOfProducts();

    for (var own in ownProducts) {
      if (qrData.decrypted == own.qrcode_id) {
        return true;
      }
    }

    return false;
  }
}

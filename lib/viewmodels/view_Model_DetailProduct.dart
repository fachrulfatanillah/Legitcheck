import 'package:flutter/material.dart';
import 'package:legitcheck/models/model_OwnOf_Products.dart';
import 'package:legitcheck/models/model_User.dart';

class ViewModelDetailProducts extends ChangeNotifier {
  Future<List<Map<String, String>>> listOwnOfProducts(
    Map<String, String> detailProduct,
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
      if (detailProduct['qrcode_id'] == own.qrcode_id) {
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
}

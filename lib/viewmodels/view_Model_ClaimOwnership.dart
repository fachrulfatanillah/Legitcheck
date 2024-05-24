import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_Functions.dart';
import 'package:legitcheck/viewmodels/view_Model_OwnOf_Products.dart';
import 'package:legitcheck/viewmodels/view_Model_Profile.dart';
import 'package:legitcheck/views/bottom_NavBar.dart';
import 'package:provider/provider.dart';

class ViewModelClaimNow extends ChangeNotifier {
  Future<void> claimOwnership(
      String password, String dataDecrypted, BuildContext context) async {
    final encryptionService = EncryptionService();
    String userPassword =
        Provider.of<ViewModelProfile>(context, listen: false).password;
    try {
      if (password == '') {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text('password is empty.',
                  style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text('Close', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          },
        );
      }
      final encryptedDataPassword = encryptionService.encrypt(password);
      if (userPassword == encryptedDataPassword) {
        try {
          OwnOfProductPost postData = OwnOfProductPost();
          await postData.addOwnOfProduct(dataDecrypted,
              Provider.of<ViewModelProfile>(context, listen: false).id);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                title: null,
                content: Text(
                  'Claim successful',
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    },
                    child: Center(
                      child: Text('Oke', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              );
            },
          );
        } catch (e) {
          print('Error registering user: $e');
        }
      } else {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text('password is incorrect.',
                  style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text('Close', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}

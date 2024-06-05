import 'package:flutter/material.dart';
import 'package:legitcheck/models/model_User.dart';
import 'package:legitcheck/viewmodels/view_Model_Functions.dart';
import 'package:legitcheck/viewmodels/view_Model_OwnOf_Products.dart';
import 'package:legitcheck/viewmodels/view_Model_User.dart';
import 'package:legitcheck/views/bottom_NavBar.dart';

class ViewModelSendOwnership extends ChangeNotifier {
  Future<String?> isValidEmail(String email) async {
    try {
      UserGet userRepository = UserGet();
      List<User> users = await userRepository.getUsers();
      for (var user in users) {
        if (user.email == email) {
          return user.id;
        }
      }
      return null;
    } catch (e) {
      print('Error occurred while validating email: $e');
      return null;
    }
  }

  Future<void> sendOwnership(
    String id,
    String qrcode_id,
    String email,
    String password,
    String userPassword,
    BuildContext context,
  ) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Email and Password can not be empty',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
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

      if (await isValidEmail(email) != null) {
        final encryptionService = EncryptionService();
        final encryptedData_Password = encryptionService.encrypt(password);
        if (encryptedData_Password != userPassword) {
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                title: null,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Incorrect Password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child:
                          Text('Close', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          OwnOfProductUpdate modelOwnProducts = OwnOfProductUpdate();
          OwnOfProductPost postData = OwnOfProductPost();
          await modelOwnProducts.updateOwnOfProduct(id);
          await postData.addOwnOfProduct(
              qrcode_id, await isValidEmail(email) ?? '');
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                title: null,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Send successful',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    },
                    child: Center(
                      child:
                          Text('Close', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              );
            },
          );
        }
      } else {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Email not found',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
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
      print(e);
    }
  }
}

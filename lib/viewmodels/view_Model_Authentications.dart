import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:legitcheck/models/model_AuthenticationsUsers.dart';
import 'package:legitcheck/models/model_User.dart';
import 'package:legitcheck/viewmodels/view_Model_AuthenticationsUsers.dart';
import 'package:legitcheck/viewmodels/view_Model_Functions.dart';
import 'package:legitcheck/viewmodels/view_Model_User.dart';
import 'package:legitcheck/views/authentication.dart';
import 'package:legitcheck/views/login.dart';
import 'package:legitcheck/views/reset_Password.dart';

class PasswordValidator {
  static bool isValidPassword(String password) {
    RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|":<>?])[A-Za-z\d!@#$%^&*()_+{}|":<>?]{8,}$');
    return regex.hasMatch(password);
  }
}

class Authentications extends ChangeNotifier {
  Future<void> resetPasword(String id, String email, String password,
      String confirmPassword, BuildContext context) async {
    try {
      if (!password.isEmpty || !confirmPassword.isEmpty) {
        if (password == confirmPassword) {
          if (PasswordValidator.isValidPassword(password)) {
            final encryptionService = EncryptionService();
            final encryptedData = encryptionService.encrypt(password);

            UserUpdate userUpdate = UserUpdate();
            await userUpdate.updateUser(id, encryptedData);

            return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 23, 23, 23),
                  title: null,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          'Reset Password successful.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Center(
                        child:
                            Text('Oke', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 23, 23, 23),
                  title: null,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          'Password must contain at least 1 uppercase letter, 1 number, and 1 special character.',
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
                            Text('Oke', style: TextStyle(color: Colors.white)),
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
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                title: null,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Password and Verification Password does not match.',
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
                      child: Text('Oke', style: TextStyle(color: Colors.white)),
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
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Password can not empty.',
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
                    child: Text('Oke', style: TextStyle(color: Colors.white)),
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

  Future<void> reSendOtp(String id, String email, BuildContext context) async {
    try {
      final DateTime now = DateTime.now();

      final DateTime expiredTimeAt = now.add(Duration(seconds: 100));

      final String formatDateNow = DateFormat('yyyy-MM-dd').format(now);
      final String formatTimeNow = DateFormat('HH:mm:ss').format(now);
      final String formatExpiredDate =
          DateFormat('yyyy-MM-dd').format(expiredTimeAt);
      final String formatExpiredTime =
          DateFormat('HH:mm:ss').format(expiredTimeAt);

      AuthenticationsPost sendOTP = AuthenticationsPost();
      await sendOTP.onetimepasswordPost(id, email, formatDateNow, formatTimeNow,
          formatExpiredDate, formatExpiredTime);

      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
            title: null,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'OTP has been sent to your email, if it is not in your inbox, check your email spam.',
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
                  child: Text('Oke', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  Future<void> sendOtp(String email, BuildContext context) async {
    try {
      if (email != '') {
        bool isValidCredentials = false;
        String id = '';
        UserGet userRepository = UserGet();
        List<User> users = await userRepository.getUsers();

        for (var user in users) {
          if (user.email == email) {
            isValidCredentials = true;
            id = user.id;
            break;
          }
        }
        if (isValidCredentials) {
          final DateTime now = DateTime.now();

          final DateTime expiredTimeAt = now.add(Duration(seconds: 100));

          final String formatDateNow = DateFormat('yyyy-MM-dd').format(now);
          final String formatTimeNow = DateFormat('HH:mm:ss').format(now);
          final String formatExpiredDate =
              DateFormat('yyyy-MM-dd').format(expiredTimeAt);
          final String formatExpiredTime =
              DateFormat('HH:mm:ss').format(expiredTimeAt);

          AuthenticationsPost sendOTP = AuthenticationsPost();
          await sendOTP.onetimepasswordPost(id, email, formatDateNow,
              formatTimeNow, formatExpiredDate, formatExpiredTime);

          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                title: null,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'OTP has been sent to your email, if it is not in your inbox, check your email spam.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AuthenticationPage(user_id: id, email: email),
                        ),
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
        } else {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                title: null,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Email not found.',
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
        }
      } else {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Please enter your email.',
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
      print('Terjadi kesalahan: $e');
    }
  }

  Future<void> checkOtp(
      String id, String email, String pin, BuildContext context) async {
    try {
      OtpGet authentication = OtpGet();
      List<Authentication> dataAuthentications =
          await authentication.getAuthentication();

      bool isValidCredentials = false;

      String id_otp = '';
      String otpDate = '';
      String otpTime = '';

      for (var otp in dataAuthentications) {
        if (otp.user_id == id && otp.status == '0' && otp.otp == pin) {
          otpDate = otp.date_expired_at;
          otpTime = otp.time_expired_at;

          isValidCredentials = true;
          id_otp = otp.id;
        }
      }

      if (isValidCredentials) {
        //ini dia
        if (await checkDateTime(otpDate, otpTime)) {
          AuthenticationsUpdate authentication = AuthenticationsUpdate();
          await authentication.updateOTP(id_otp);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ResetPasswordPage(user_id: id, email: email),
            ),
          );
        } else {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                title: null,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'OTP expired.',
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
        }
      } else {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Invalid OTP.',
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
      print('$e');
    }
  }

  Future<bool> checkDateTime(String dateExpiredAt, String timeExpiredAt) async {
    final DateTime now = DateTime.now();

    final String formattedDateNow =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final DateTime parsedDateTimeNow =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(formattedDateNow);

    DateTime expiredDate = DateFormat('yyyy-MM-dd').parse(dateExpiredAt);
    DateTime expiredTime = DateFormat('HH:mm:ss').parse(timeExpiredAt);

    DateTime expiredDateTime = DateTime(
      expiredDate.year,
      expiredDate.month,
      expiredDate.day,
      expiredTime.hour,
      expiredTime.minute,
      expiredTime.second,
    );
    return expiredDateTime.isAfter(parsedDateTimeNow);
  }
}

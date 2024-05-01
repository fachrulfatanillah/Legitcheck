import 'package:encrypt/encrypt.dart';

class EncryptionService {
  final key = Key.fromUtf8('this_is_a_secret_key_12345_67890');
  final iv = IV.fromUtf8('this_is_an_iv_16');

  String encrypt(String data) {
    final checkString = CheckString();
    final escapedData = checkString.escapeDollarSign(data);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(escapedData, iv: iv);
    return encrypted.base64;
  }
}

class DecryptionService {
  final key = Key.fromUtf8('this_is_a_secret_key_12345_67890');
  final iv = IV.fromUtf8('this_is_an_iv_16');

  String decrypt(String encryptedBase64) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encryptedData = Encrypted.fromBase64(encryptedBase64);
    final decryptedText = encrypter.decrypt(encryptedData, iv: iv);
    return decryptedText;
  }
}

class CheckString {
  String escapeDollarSign(String input) {
    return input.replaceAllMapped(
      RegExp(r'\$'),
      (match) => '\\\$',
    );
  }
}

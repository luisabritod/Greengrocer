import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  final storage = const FlutterSecureStorage();

  // Save data to secure storage
  Future<void> saveLocalData(
      {required String key, required String data}) async {
    await storage.write(
      key: key,
      value: data,
    );
  }

  // Get data from secure storage
  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  // Delete data from secure storage
  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }

  String priceToCurrency(double price) {
    NumberFormat format = NumberFormat.simpleCurrency(locale: 'en_us');

    return format.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat date = DateFormat.yMd('en_US').add_Hm();
    return date.format(dateTime.toLocal());
  }

  Uint8List decodeQrCode(String value) {
    String base64String = value.split(',').last;

    return base64.decode(base64String);
  }

  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14.0,
    );
  }
}

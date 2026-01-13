import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  // Nota: Métodos de storage removidos - Firebase gerencia a sessão automaticamente

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

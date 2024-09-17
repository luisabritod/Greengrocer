import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat format = NumberFormat.simpleCurrency(locale: 'en_us');

    return format.format(price);
  }
}

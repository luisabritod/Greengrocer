import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(String price) {
    NumberFormat format = NumberFormat.simpleCurrency(locale: 'en_us');
    double priceValue = double.parse(price);

    return format.format(priceValue);
  }
}

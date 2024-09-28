import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat format = NumberFormat.simpleCurrency(locale: 'en_us');

    return format.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat date = DateFormat.yMd('en_US').add_Hm();
    return date.format(dateTime);
  }
}

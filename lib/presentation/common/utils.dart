import 'package:intl/intl.dart';

class Utils {
  static String returnMonth(DateTime date) {
    return new DateFormat.MMMM().format(date);
  }

  static String returnCurrency(var data, String name) {
    return new NumberFormat.currency(name: name).format(data);
  }
}

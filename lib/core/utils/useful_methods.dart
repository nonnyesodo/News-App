import 'package:intl/intl.dart';

class UsefulMethods {
  static formatDate({required String date}) {
    DateTime dateTime = DateTime.parse(date);

    DateFormat outputFormat = DateFormat('dd/MM/yyyy, HH:mm:ss');
    return outputFormat.format(dateTime.toLocal());
  }
}

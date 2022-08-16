import 'package:intl/intl.dart';

String getCurrency(dynamic number) {
  final oCcy = NumberFormat("#,##0", "en_US");
  return oCcy.format(number);
}

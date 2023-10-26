import 'package:intl/intl.dart';

String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

String formatCurrency(num number, {String symbol = 'Rp'}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

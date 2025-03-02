import 'package:money2/money2.dart';

class MoneyFormatter {
  const MoneyFormatter._();

  static String getPrice(double cost) {
    return Money.fromNum(cost, isoCode: 'BRL').toString();
  }
}

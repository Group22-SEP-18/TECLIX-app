import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/presentation/common/utils.dart';

main() {
  test('Should return current month\'s name', () {
    String month = Utils.returnMonth(DateTime.now());
    expect(month, 'November');
  });

  test('Should return number converted to currency format', () {
    String currency = Utils.returnCurrency(2500, 'Rs ');
    expect(currency, 'Rs 2,500.00');
  });
}

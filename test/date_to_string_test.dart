import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';

void main() {
  test('Convert date time to string test', () {
    // Assert
    final ctrl = UploadController();

    // Actual
    final String result = ctrl.convertDateTimeToString(DateTime(2023, 01, 01));

    // Expected
    expect(result, "2023-1-1");
  });
}

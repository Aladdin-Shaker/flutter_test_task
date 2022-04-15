import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';

void main() {
  test('Convert bytes to string test', () {
    // Assert
    final ctrl = UploadController();

    // Actual
    final String result = ctrl.formatBytesToReadable(1048576, 0);

    // Expected
    expect(result, "1 MB");
  });
}

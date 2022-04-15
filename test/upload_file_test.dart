import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';

void main() {
  test('uploaded file test', () async {
    // Assert
    final ctrl = UploadController();
    final PlatformFile file = PlatformFile(name: 'test.pdf', size: 500000);

    // Actual
    final Future<UploadTask?> result = ctrl.uploadFile(file);

    // Expected
    expect(result, isNotNull);
  });

  test('Unuploaded file test', () async {
    // Arrange
    final ctrl = UploadController();

    // Actual
    Future<UploadTask?> result = ctrl.uploadFile(null).then((value) {
      expect(value, null);
      return null;
    });

    // Assert
    expect(result, completes);
  });
}

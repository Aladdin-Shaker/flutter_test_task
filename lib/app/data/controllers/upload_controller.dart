import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/models/fileFire.dart';
import 'package:test_task/app/views/widgets/download_progress.dart';

class UploadController extends ChangeNotifier {
  PlatformFile? file;
  UploadTask? uploadTask;
  List<FileFire> listFiles = [];

  void removeSelectedFile() {
    file = null;
    uploadTask = null;
    notifyListeners();
  }

  Future<FilePickerResult?> selectedFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      dialogTitle: 'Please select $filesTypes file:',
      type: FileType.custom,
      allowedExtensions: filesTypes,
    );

    if (result != null) {
      file = result.files.first;
    } else {
      file = null;
    }
    notifyListeners();
    return null;
  }

  Future<UploadTask?> uploadFile(PlatformFile? file) async {
    try {
      if (file != null && file.path != null) {
        final String fName = file.name;
        final String dist = "uploads/$fName";
        final File fileForFirebase = File(file.path!);
        uploadTask = uploadSingleFile(dist, fileForFirebase)!;
        if (uploadTask == null) {
          notifyListeners();
          return null;
        }
        notifyListeners();
        return uploadTask;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Widget buildUploadStatus() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask!.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).ceilToDouble();

            SchedulerBinding.instance?.addPostFrameCallback((_) {
              if (percentage == 100.0) {
                uploadTask = null;
                file = null;
                listAllFiles('uploads/');
                notifyListeners();
              }
            });
            return downloadProgress(percentage: percentage);
          } else {
            notifyListeners();
            return const SizedBox.shrink();
          }
        },
      );

  UploadTask? uploadSingleFile(String dist, File file) {
    try {
      final storageRef = FirebaseStorage.instance.ref(dist);
      return storageRef.putFile(file);
    } on FirebaseException {
      return null;
    }
  }

  Future<List<FullMetadata>> _extractMetaData(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getMetadata()).toList());

  Future<void> listAllFiles(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final data = await _extractMetaData(result.items);
    listFiles = data
        .asMap()
        .map((index, item) {
          final file = FileFire(
            convertDateTimeToString(item.timeCreated),
            item.contentType,
            item.name,
            formatBytesToReadable(item.size, 2),
            item.contentLanguage,
            ref,
          );
          return MapEntry(index, file);
        })
        .values
        .toList();

    notifyListeners();
  }

  String convertDateTimeToString(DateTime? date) {
    final String y = date!.toLocal().year.toString();
    final String m = date.toLocal().month.toString();
    final String d = date.toLocal().day.toString();

    return '$y-$m-$d';
  }

  String formatBytesToReadable(int? bytes, int decimals) {
    if (bytes! <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  Future downloadFile(FileFire fileRef) async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final downloadToFile = File('${appDocDir.path}/${fileRef.name}');
      final String fileToDownload = "${fileRef.ref.fullPath}/${fileRef.name}";
      await FirebaseStorage.instance
          .ref(fileToDownload)
          .writeToFile(downloadToFile);
      return true;
    } on FirebaseException {
      return false;
    }
  }

  Future<bool> deleteFile(FileFire fileRef) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final desertRef =
          storageRef.child("${fileRef.ref.fullPath}/${fileRef.name}");
      await desertRef.delete();
      listAllFiles('uploads/');
      notifyListeners();
      return true;
    } on FirebaseException {
      return false;
    }
  }
}

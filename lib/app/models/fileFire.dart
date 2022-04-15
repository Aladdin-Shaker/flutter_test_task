// ignore_for_file: file_names

import 'package:firebase_storage/firebase_storage.dart';

class FileFire {
  final String? timeCreated;
  final String? contentType;
  final String? name;
  final String? size;
  final String? contentLanguage;
  final Reference ref;

  FileFire(this.timeCreated, this.contentType, this.name, this.size,
      this.contentLanguage, this.ref);
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';
import 'package:test_task/app/models/fileFire.dart';
import 'package:test_task/app/views/widgets/file_card.dart';

class FilesList extends StatelessWidget {
  const FilesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Consumer<UploadController>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.listFiles.length,
            itemBuilder: (context, index) {
              final FileFire _file = provider.listFiles[index];
              return fileCard(ctx: context, file: _file);
            },
          );
        },
      ),
    );
  }
}

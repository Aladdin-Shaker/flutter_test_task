import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/config/sizes.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';
import 'package:test_task/app/views/widgets/custom_appbar.dart';
import 'package:test_task/app/views/widgets/files_list.dart';
import 'package:test_task/app/views/widgets/upload_file.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UploadController>(context, listen: false)
        .listAllFiles('uploads/');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(
          title: const Text(
        'My Files',
        style: TextStyle(
          color: kTitleColor,
        ),
      )),
      body: Column(
        children: const [UploadFile(), FilesList()],
      ),
    );
  }
}

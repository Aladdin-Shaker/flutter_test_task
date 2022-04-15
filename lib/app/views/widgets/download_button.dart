import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/config/sizes.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';
import 'package:test_task/app/models/fileFire.dart';

Container downloadButton({
  required FileFire file,
  required BuildContext context,
}) {
  return Container(
    width: SizeConfig.screenWidth / 2,
    height: getProportionateScreenHeight(50),
    margin: const EdgeInsets.all(30),
    child: ElevatedButton(
      child: const Text(
        'DOWNLOAD',
        style: TextStyle(fontSize: kh3Size),
      ),
      onPressed: () async {
        final result =
            await Provider.of<UploadController>(context, listen: false)
                .downloadFile(file);
        if (result != null) {
          final snackBar = SnackBar(
            content: Text('${file.name} file downloaded successfully'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
        }
      },
    ),
  );
}

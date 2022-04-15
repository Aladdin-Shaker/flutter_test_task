import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/config/sizes.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';
import 'package:test_task/app/models/fileFire.dart';
import 'package:test_task/app/views/screens/single_file_screen/single_file_screen.dart';

Widget fileCard({
  required BuildContext ctx,
  required FileFire file,
}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (ctx) => SingleFileScreen(file),
        ),
      );
    },
    child: Card(
      child: ListTile(
        title: Text(
          file.name!,
          style: const TextStyle(
            color: kTitleColor,
            fontSize: kh3Size,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Row(
          children: [
            Text(file.size.toString()),
            SizedBox(width: getProportionateScreenHeight(10)),
            Text(file.timeCreated.toString())
          ],
        ),
        leading: Icon(
          Icons.file_copy_rounded,
          color: Colors.blue[500],
        ),
        trailing: CircleAvatar(
          backgroundColor: kSubTitleColor,
          radius: kCircleAvatarRaduis,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.close, size: 12.0),
            color: Colors.white,
            onPressed: () {
              Provider.of<UploadController>(ctx, listen: false)
                  .deleteFile(file)
                  .then(
                (value) {
                  if (value == true) {
                    const snackBar = SnackBar(
                      content: Text('File deleted successfully'),
                    );
                    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
                  }
                },
              );
            },
          ),
        ),
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (ctx) => SingleFileScreen(file),
            ),
          );
        },
      ),
    ),
  );
}

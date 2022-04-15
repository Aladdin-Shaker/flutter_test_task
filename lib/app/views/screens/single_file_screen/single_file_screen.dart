import 'package:flutter/material.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/config/sizes.dart';
import 'package:test_task/app/models/fileFire.dart';
import 'package:test_task/app/views/widgets/custom_appbar.dart';
import 'package:test_task/app/views/widgets/download_button.dart';
import 'package:test_task/app/views/widgets/file_details_container.dart';

class SingleFileScreen extends StatelessWidget {
  final FileFire file;

  const SingleFileScreen(this.file, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(
        title: const Text(
          'Single File Details',
          style: TextStyle(color: kTitleColor),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(kMarging),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  fileDetailsContainer(title: file.contentType.toString()),
                  fileDetailsContainer(title: file.timeCreated.toString()),
                ],
              ),
            ),
            const SizedBox(height: kSectionsSpace),
            Container(
              decoration: const BoxDecoration(color: kSecondaryColor),
              child: Icon(
                Icons.file_download,
                color: Colors.amber,
                size: getProportionateScreenWidth(100),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            Text(file.name.toString(), style: titleStyle),
            SizedBox(height: getProportionateScreenHeight(14)),
            Text(
              file.size.toString(),
              style: subTitleStyle,
            ),
            downloadButton(file: file, context: context),
          ],
        ),
      ),
    );
  }
}

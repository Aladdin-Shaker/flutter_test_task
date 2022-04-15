import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/config/sizes.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';
import 'package:test_task/app/views/widgets/custom_alert_snackbar.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: kBkGroundColor,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              if (Provider.of<UploadController>(context, listen: false)
                      .uploadTask ==
                  null) ...[
                if (Provider.of<UploadController>(context).file != null)
                  InkWell(
                    onTap: () {
                      final prov =
                          Provider.of<UploadController>(context, listen: false);

                      if (prov.file!.size > fileMaxSize) {
                        final alert = customAlertSnackbar(
                          msg:
                              'Can not upload a file bigger than ${prov.formatBytesToReadable(fileMaxSize, 0)} !',
                        );

                        ScaffoldMessenger.of(context).showSnackBar(alert);
                        return;
                      }

                      if (!filesTypes
                          .contains(prov.file!.extension.toString())) {
                        final alert = customAlertSnackbar(
                          msg:
                              'Selected file not allowed, please select file of type $filesTypes',
                        );

                        ScaffoldMessenger.of(context).showSnackBar(alert);
                        return;
                      }
                      prov.uploadFile(prov.file);
                    },
                    child: Icon(
                      Icons.cloud_upload_rounded,
                      color: kUploadColor,
                      size: getProportionateScreenWidth(70),
                    ),
                  )
                else
                  InkWell(
                    onTap: () => {
                      Provider.of<UploadController>(context, listen: false)
                          .selectedFile()
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: kPrimaryColor,
                      size: getProportionateScreenWidth(70),
                    ),
                  ),
                if (Provider.of<UploadController>(context).file != null)
                  const Text(
                    'Upload Your File',
                    style: titleStyle,
                  )
                else
                  const Text(
                    'Select File To Upload ',
                    style: titleStyle,
                  ),
              ] else ...[
                Provider.of<UploadController>(context).buildUploadStatus(),
              ],
              SizedBox(height: getProportionateScreenHeight(15)),
              const Text(
                'Try to upload more files to see them here',
                style: subTitleStyle,
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              if (Provider.of<UploadController>(context).uploadTask == null)
                if (Provider.of<UploadController>(context).file != null)
                  InkWell(
                    onTap: () {
                      Provider.of<UploadController>(context, listen: false)
                          .removeSelectedFile();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Provider.of<UploadController>(
                            context,
                            listen: false,
                          ).file!.name,
                          style: subTitleStyle,
                        ),
                        Icon(
                          Icons.close,
                          size: getProportionateScreenWidth(15),
                        ),
                      ],
                    ),
                  )
                else
                  const Text(
                    'No file selected',
                    style: subTitleStyle,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

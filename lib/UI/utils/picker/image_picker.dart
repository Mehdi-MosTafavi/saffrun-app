import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

Future<File?> getImage(BuildContext context) async {
  //''(await Connection.GetAllServices());
  var image = await ImagePickerGC.pickImage(
    context: context,
    maxHeight: 1280,
    maxWidth: 1280,
    cameraText: Text('دوربین'),
    galleryText: Text('گالری'),
    source: ImgSource.Both,

    cameraIcon: Icon(
      LineAwesomeIcons.camera,
      color: Color(0xffe9446a),
    ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
  );
  // if(image==null) {
  //   return null;
  // }
  // File? croppedFile = await ImageCropper.cropImage(
  //   sourcePath: image.path,
  //
  //   aspectRatioPresets: [
  //     // CropAspectRatioPreset.square,
  //     // CropAspectRatioPreset.ratio3x2,
  //     CropAspectRatioPreset.original,
  //     // CropAspectRatioPreset.ratio4x3,
  //     // CropAspectRatioPreset.ratio16x9
  //   ],
  //
  //   cropStyle: CropStyle.circle,
  //   androidUiSettings: const AndroidUiSettings(
  //       toolbarTitle: 'Cropper',
  //
  //       toolbarColor: Color(0xffea004e),
  //       statusBarColor: Color(0xffea004e),
  //       cropFrameColor: Color(0xffea004e),
  //       toolbarWidgetColor: Colors.white,
  //       initAspectRatio: CropAspectRatioPreset.original,
  //       lockAspectRatio: false),
  //   iosUiSettings: const IOSUiSettings(
  //     minimumAspectRatio: 1.0,
  //   ),
  // );
  // print(croppedFile.path.toString().split('/').last);
  if (image == null) {
    return null;
  }
  return File(image.path);
}

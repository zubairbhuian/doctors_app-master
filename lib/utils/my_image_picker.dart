import 'dart:io';
import 'package:doctors_app/widgets/popup_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker {
  static Future<void> pickVideo({
    ImageSource imageSource = ImageSource.gallery,
    CameraDevice cameraDevice = CameraDevice.rear,
    required Function(String path, String name) onVideoPicked,
  }) async {
    final videoPicked = await ImagePicker().pickVideo(
      source: imageSource,
      preferredCameraDevice: cameraDevice,
      // maxDuration: Duration(seconds: 120),
    );

    if (videoPicked != null) {
      onVideoPicked(videoPicked.path, videoPicked.name);
    }
  }

  static Future<File> pickImageAndCrop() async {
    final XFile? image = await pickImage();
    if (image != null) {
      final CroppedFile? croppedFile = await cropImage(sourcePath: image.path);
      if (croppedFile != null) {
        return File(croppedFile.path);
      } else {
        throw Exception("Image not cropped");
      }
    } else {
      throw Exception("Image not selected");
    }
  }

  static Future<ImageSource> getImageSource() async {
    return await Get.dialog(
      AlertDialog(
        title: Text(
          "Select Image Source",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.camera,
              ),
              title: Text(
                "Camera",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.back(result: ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo,
              ),
              title: Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.back(result: ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    final imageSource = await getImageSource();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      return image;
    } else {
      throw Exception("Image not selected");
    }
  }

  static Future<List<XFile>?> pickMultipleImage() async {
    final picker = ImagePicker();
    List<XFile> imageList = [];
    final List<XFile> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      final int limit = images.length >= 3 ? 3 : images.length;
      for (int i = 0; i < limit; i++) {
        imageList.add(images[i]);
      }

      if (images.length > 3) {
        PopupDialog.showErrorMessage("Max 3 image allowed");
      }
      return imageList;
    } else {
      throw Exception("Image not selected");
    }
  }

  static Future<CroppedFile?> cropImage({required String sourcePath,List<CropAspectRatioPreset>? aspectRatioPresets}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: sourcePath,
      aspectRatioPresets:aspectRatioPresets?? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.grey,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: Get.context!,
        ),
      ],
    );
    return croppedFile;
  }
}

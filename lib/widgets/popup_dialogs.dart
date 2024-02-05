import 'package:doctors_app/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';



class PopupDialog {
   // SuccessDialog
  static void showSuccessDialog(String message) {
    var snackBar = SnackBar(
      dismissDirection: DismissDirection.horizontal,
      // behavior: SnackBarBehavior.floating,
      backgroundColor: kSuccessColor,
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  // error messase
  static void showErrorMessage(String message) {
    var snackBar = SnackBar(
      // behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: kDangerColor,
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
  // Loading Dialog

  static showLoadingDialog() {
    return showDialog<void>(
      // Context
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          // for horizontal minHeight
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // for ertical minWidth
            Center(
              child: SizedBox(
                // dialog width
                width: 80,
                height: 80,
                child: Material(
                  elevation: 2,
                  // dialog color
                  shadowColor: Colors.black12,
                  // backgraund color
                  color: kWhite,
                  // border radius
                  borderRadius: BorderRadius.circular(8),
                  // main body
                  child: const SpinKitWave(
                    color: kPrimaryColor, // You can customize the color
                    size: 25, // You can customize the size
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // close dialog
  static void closeLoadingDialog() {
    Get.back();
  }
  
}

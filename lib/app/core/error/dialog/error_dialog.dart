import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/constants/textstyles.dart';
import 'package:nasa_apod_app/app/widgets/rounded_button.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(
      {super.key, required this.title, required this.message, this.onPressed});

  final String title;
  final String? message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        // height: 1.sh / 3.5,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: headingTextStyle.copyWith(fontSize: 34),
              ),
              Text(
                message!,
                style: bodyTextStyle,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.w),
                child: RoundedButton(
                  textChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Okay",
                        style: buttonTextStyle,
                      ),
                    ],
                  ),
                  onPressed: onPressed ??
                      () {
                        Get.back();
                      },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color color;
  final EdgeInsets? verticalPadding;
  final double? textSize;
  final double? height;
  final Widget? textChild;
  final bool isBorderedButton;

  const RoundedButton({
    super.key,
    this.text,
    @required this.onPressed,
    this.verticalPadding,
    this.textChild,
    this.textSize = 16,
    this.height = 48.0,
    this.color = secondaryColor,
    this.isBorderedButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
      child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 2.h)),
              overlayColor: MaterialStateProperty.all<Color>(
                  Colors.grey.withOpacity(0.2)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  color == Colors.white ? Colors.white : secondaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0.r),
                      side: BorderSide(
                          color: color == Colors.white
                              ? Colors.grey.withOpacity(0.05)
                              : secondaryColor,
                          width: 2.w)))),
          onPressed: onPressed,
          child: textChild ??
              Text(
                text ?? "Placeholder",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
    );
  }
}

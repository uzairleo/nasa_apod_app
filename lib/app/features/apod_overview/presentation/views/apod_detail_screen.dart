import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';
import 'package:nasa_apod_app/app/core/constants/textstyles.dart';

class ApodDetailScreen extends StatelessWidget {
  const ApodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            ///
            ///Top section having image and back button
            ///
            topSection(),

            ///
            ///Bottom section title and description
            ///
            bottomSection(),
          ],
        ),
      ),
    );
  }

  Widget bottomSection() {
    return Padding(
      padding: EdgeInsets.only(top: 1.sh - (1.sh / 1.9)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 30.h),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.r),
              topRight: Radius.circular(60.r),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "July 24, 2023",
                  style: bodyTextStyle.copyWith(fontSize: 14),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ))
              ],
            ),
            Text(
              "Betelgeuse Super Novae Phenomenon Captured",
              style: headingTextStyle.copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Description ',
              textAlign: TextAlign.left,
              style: bodyTextStyle.copyWith(),
            ),
          ],
        ),
      ),
    );
  }

  topSection() {
    return Container(
      height: 1.sh - 336.h,
      color: primaryColor,
      child: Stack(
        children: [
          FadeInImage.assetNetwork(
            height: 1.sh - 336.h,
            placeholder: 'assets/images/placeholder.jpeg',
            image: 'https://apod.nasa.gov/apod/image/2401/ngc1232b_vlt_960.jpg',
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

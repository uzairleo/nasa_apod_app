import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';
import 'package:nasa_apod_app/app/core/constants/textstyles.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';

class ApodDetailScreen extends StatelessWidget {
  final Apod apod;
  const ApodDetailScreen({required this.apod, super.key});

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
                  apod.date!,
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
              apod.title!,
              style: headingTextStyle.copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              apod.explanation!,
              textAlign: TextAlign.left,
              style: bodyTextStyle.copyWith(),
            ),
          ],
        ),
      ),
    );
  }

  topSection() {
    final cardHeight = 1.sh - 336.h;
    return Container(
      height: 1.sh - 336.h,
      color: primaryColor,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: apod.url!,
            height: cardHeight,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: cardHeight,
              width: double.infinity,
              color: Colors.grey[700],
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 80,
                  color: Colors.white60,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fadeInDuration: const Duration(milliseconds: 500),
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

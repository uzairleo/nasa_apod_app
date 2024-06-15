import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';
import 'package:nasa_apod_app/app/core/constants/textstyles.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/views/apod_detail_screen.dart';

class ApodImageTile extends StatelessWidget {
  const ApodImageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth * 0.5;
        double cardHeight = cardWidth * 0.6;

        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: GestureDetector(
            onTap: () {
              Get.to(const ApodDetailScreen());
            },
            child: Card(
              color: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Container(
                width: cardWidth,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        'https://apod.nasa.gov/apod/image/2401/ngc1232b_vlt_960.jpg',
                        height: cardHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text('Betelgeuse Super Novae Phenomenon Captured',
                        style: bodyTextStyle.copyWith(fontSize: 16.sp)),
                    const SizedBox(height: 5.0),
                    Text(
                      'July 24, 2023',
                      style: bodyTextStyle.copyWith(
                        fontSize: 12.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

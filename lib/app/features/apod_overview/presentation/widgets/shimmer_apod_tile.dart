import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';

class ShimmerApodTile extends StatelessWidget {
  const ShimmerApodTile({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth * 0.5;
        double cardHeight = cardWidth * 0.6;

        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
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
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[800]!,
                      highlightColor: Colors.grey[500]!,
                      child: Container(
                        height: cardHeight,
                        width: double.infinity,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      width: double.infinity,
                      height: 20.h,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      width: 100.w,
                      height: 15.h,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

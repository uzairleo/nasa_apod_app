import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';
import 'package:nasa_apod_app/app/core/constants/textstyles.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/views/apod_detail_screen.dart';

class ApodImageTile extends StatelessWidget {
  final Apod? apod;
  const ApodImageTile({this.apod, super.key});

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
              Get.to(ApodDetailScreen(apod: apod!),
                  transition: Transition.topLevel);
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
                      child: CachedNetworkImage(
                        imageUrl: apod!.url!,
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
                              size: 50,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fadeInDuration: const Duration(milliseconds: 500),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text('${apod!.title}',
                        style: bodyTextStyle.copyWith(fontSize: 16.sp)),
                    const SizedBox(height: 5.0),
                    Text(
                      '${apod!.date}',
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

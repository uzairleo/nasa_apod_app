import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/widgets/apod_image_tile.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/widgets/image_container.dart';

class ApodListScreen extends StatelessWidget {
  const ApodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              header(),

              ///
              ///Search bar on top
              ///
              searhcBar(),

              ///
              ///List of APOD images
              ///
              apodListView(),
            ],
          ),
        ),
      ),
    );
  }

  header() {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageContainer(
            height: 30.h,
            width: 100.w,
            assets: "assets/images/nasa_logo.png",
          )
        ],
      ),
    );
  }

  searhcBar() {
    return SizedBox(
      height: 40.h,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 3.0.h),
        ),
      ),
    );
  }

  apodListView() {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const ApodImageTile(),
    );
  }
}

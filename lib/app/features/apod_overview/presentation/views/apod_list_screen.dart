import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/constants/constant.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/view_model/apod_view_model.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/widgets/apod_image_tile.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/widgets/image_container.dart';
import 'package:nasa_apod_app/app/features/apod_overview/presentation/widgets/shimmer_apod_tile.dart';

class ApodListScreen extends StatelessWidget {
  const ApodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ApodViewModel>(
      init: ApodViewModel(),
      builder: (viewModel) => Scaffold(
        backgroundColor: primaryColor,
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                !viewModel.isLoadingMore.value) {
              viewModel.loadMore();
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              await viewModel.fetchApods(page: 1, isRefresh: true);
            },
            child: SingleChildScrollView(
              controller: viewModel.scrollController,
              physics: const BouncingScrollPhysics(),
              // primary: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    header(),

                    ///
                    /// Search bar on top
                    ///
                    searchBar(viewModel),

                    ///
                    /// List of APOD images
                    ///
                    viewModel.isLoading.value
                        ? shimmerListView()
                        : apodListView(viewModel),

                    if (viewModel.isLoadingMore.value) shimmerListView(),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => viewModel.isFabVisible.value
              ? FloatingActionButton(
                  backgroundColor: fabColor,
                  onPressed: viewModel.scrollToTop,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget header() {
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

  Widget searchBar(ApodViewModel viewModel) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        onChanged: viewModel.filterApods,
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

  Widget apodListView(ApodViewModel viewModel) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      itemCount: viewModel.filteredApods.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ApodImageTile(
        apod: viewModel.filteredApods[index],
      ),
    );
  }

  Widget shimmerListView() {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const ShimmerApodTile(),
    );
  }
}

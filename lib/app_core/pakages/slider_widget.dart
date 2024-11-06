import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    // -------------------------------- Save number of images -------------------------------
    ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            enlargeFactor: 0.16.w,
            height: 114.0.h,
            viewportFraction: 0.9,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  SizedBox(
            // width: ScreenUtil().screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0.r),
              child: Image.network(
                images[itemIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0.w),
          child: ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      margin: EdgeInsets.only(right: 5.0.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120.0.r),
                        color: currentIndex.value == index
                            ? Colors.white
                            : const Color(0xffd2d2d2),
                      ),
                      width: currentIndex.value == index ? 30.0.w : 5.0.w,
                      height: 4.0.h,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

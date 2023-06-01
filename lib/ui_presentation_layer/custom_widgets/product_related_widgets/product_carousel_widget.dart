import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class ProductCarouselWidget extends StatelessWidget {
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  final List<String> images;

  ProductCarouselWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // This will align the items at bottom center.
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
            autoPlay: true,
            animateToClosest: true,
            onPageChanged: (index, _) {
              return _currentCarouselIndex.value = index;
            },
          ),
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    // borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(image),
                    ),
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        // Another way of getting the position of the item at that point.
        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child:
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: ValueListenableBuilder(
            valueListenable: _currentCarouselIndex,
            builder: (context, currentIndex, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2.0, vertical: 6),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          // This currentIndex came via valueListenableBuilder from our _currentCarouselIndex variable
                          color:
                              currentIndex == i ? primaryColor : Colors.white,
                          // border: Border.all(color: greyColor.withOpacity(.5)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          //     ),
          //   ),
        ),
      ],
    );
  }
}

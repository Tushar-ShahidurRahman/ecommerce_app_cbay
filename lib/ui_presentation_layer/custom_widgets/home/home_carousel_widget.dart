import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/model/slider_model.dart';
import '../../utils/app_color.dart';

class HomeCarouselWidget extends StatelessWidget {
  SliderModel sliderModel;
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  HomeCarouselWidget({super.key, required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            autoPlay: true,
            animateToClosest: true,
            onPageChanged: (index, _) {
              return _currentCarouselIndex.value = index;
            },
          ),
          items: sliderModel.sliderData!.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image:
                            NetworkImage(slider.image ?? ''),
                      ),
                    ),
                    alignment: Alignment.center);
                    // child: Text(
                    //   'text $slider',
                    //   style: const TextStyle(fontSize: 16.0),
                    // ));
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
            valueListenable: _currentCarouselIndex,
            builder: (context, currentIndex, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < (sliderModel.sliderData?.length ?? 0); i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2.0, vertical: 6),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          // This currentIndex came via valueListenableBuilder from our _currentCarouselIndex variable
                          color: currentIndex == i ? primaryColor : null,
                          border: Border.all(color: greyColor.withOpacity(.5)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                ],
              );
            }),
      ],
    );
  }
}

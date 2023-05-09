import 'package:flutter/material.dart';

import '../custom_widgets/home/appbar_circular_icon_button_widget.dart';
import '../custom_widgets/home/home_carousel_widget.dart';
import '../custom_widgets/category_card_widget.dart';
import '../custom_widgets/home/remarks_title_widget.dart';
import '../custom_widgets/home/search_text_field.dart';
import '../custom_widgets/product_card_widget.dart';

// I didn't change this HomeScreen class to Stateful widget.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarCircularIconButtonWidget(
                iconData: Icons.person_outline, onTap: () {}),
            AppBarCircularIconButtonWidget(
                iconData: Icons.call_outlined, onTap: () {}),
            AppBarCircularIconButtonWidget(
                iconData: Icons.add_alarm_outlined, onTap: () {}),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TextField(),
              const SearchTextField(),
              const SizedBox(
                height: 8,
              ),
              HomeCarouselWidget(),
              RemarksTitleWidget(
                remarksName: 'Categories',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CategoryCardWidget(
                      name: 'Computer',
                    ),
                    CategoryCardWidget(
                      name: 'Food',
                    ),
                    CategoryCardWidget(
                      name: 'Fashion',
                    ),
                    CategoryCardWidget(
                      name: 'Furniture',
                    ),
                    CategoryCardWidget(
                      name: 'Electronics',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'Popular',
                onTapSeeAll: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'Special',
                onTapSeeAll: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'New',
                onTapSeeAll: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

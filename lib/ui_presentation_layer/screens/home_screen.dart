import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/home/appbar_circular_icon_button_widget.dart';
import '../custom_widgets/home/home_carousel_widget.dart';
import '../custom_widgets/category_card_widget.dart';
import '../custom_widgets/home/remarks_title_widget.dart';
import '../custom_widgets/home/search_text_field.dart';

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
          ],
        ),
      ),
    );
  }
}

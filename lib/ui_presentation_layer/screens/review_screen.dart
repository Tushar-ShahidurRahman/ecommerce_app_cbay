import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/common_elevated_button.dart';
import '../utils/styles.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // itemCount: reviews.length,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return
                    // return ListTile(
                    //   title: Text('Person name'),
                    //   leading: Icon(Icons.person),
                    //   subtitle: Text('fkjfkjdkfjkdfjkdjfdkjfdjfkfjkdjkdjkjjdfkdjfkdjfkjdkfjjkfdjkfdjfkdjfkjdkfjdkfjdkjfkdjfdkjfkdjfkdjfkdjfkdj', maxLines: 5),
                    // );
                    SizedBox(
                  height: 160,
                  width: 120,
                  child: Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.person_outline,
                                  color: greyColor,
                                  size: 18,
                                ),
                                radius: 12,
                                backgroundColor: softGreyColor.withOpacity(.4),
                              ),
                              SizedBox( width: 10),
                              Text('Person Name'),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text('jkjkfjldjlkdjflj'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            // height: 90,
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(.15),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )),

            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Revies(1000)',
                        style: screenTitleTextStyle.copyWith(
                            color: greyColor, fontSize: 16),
                      ),
                      // if(price?.isNotEmpty) {
                      // Text(
                      //   '\$500',
                      //   style: screenTitleTextStyle.copyWith(
                      //     color: primaryColor,
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      // }
                    ],
                  ),
                  FloatingActionButton(onPressed: () {}, child: Icon(Icons.add), backgroundColor: primaryColor, ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

//
// class ReviewScreen extends StatefulWidget {
//   @override
//   _ReviewScreenState createState() => _ReviewScreenState();
// }
//
// class _ReviewScreenState extends State<ReviewScreen> {
//   List<String> reviews = [];
//
//   void addReview(String review) {
//     setState(() {
//       reviews.add(review);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Review Page'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: reviews.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(reviews[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Write a review',
//               ),
//               onSubmitted: (String value) {
//                 addReview(value);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

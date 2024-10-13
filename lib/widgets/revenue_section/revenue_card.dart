import 'package:flutter/material.dart';
import 'package:vetqure_task/constants/revenue_section_constants.dart';
import 'package:vetqure_task/widgets/revenue_section/circular_progress_indicator.dart';

// class RevenueCard extends StatelessWidget {
//   const RevenueCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     double width = media.width;
//     double height = media.height;
//     double cardHeight = height * 0.2;
//     return SizedBox(
//       width: width,
//       height: cardHeight,
//       child: Card(
//         elevation: 4,
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             // if (constraints.maxWidth < 600) {
//             // Show a scrollable row on small screens
//             return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: indicatorsData.map((data) {
//                     return buildCircularIndicator(
//                       data['category'],
//                       data['amount'],
//                       data['percentage'],
//                       cardHeight,
//                       data['color'],
//                     );
//                   }).toList(),
//                 ));
//             //   );
//             // } else {
//             // Distribute items evenly on larger screens
//             //   return Row(
//             //     crossAxisAlignment: CrossAxisAlignment.stretch,
//             //     children: indicatorsData.map((data) {
//             //       return Expanded(
//             //         child: buildCircularIndicator(
//             //           data['category'],
//             //           data['amount'],
//             //           data['percentage'],
//             //           cardHeight,
//             //           data['color'],
//             //         ),
//             //       );
//             //     }).toList(),
//             //   );
//             // }
//           },
//         ),
//       ),
//     );
//   }

// class RevenueCard extends StatelessWidget {
//   const RevenueCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     double width = media.width;
//     double height = media.height;
//     double cardHeight = height * 0.2;
//     return SizedBox(
//       width: width,
//       child: Card(
//         color: Colors.white,
//         child: LayoutBuilder(builder: (context, constraints) {
//           return ConstrainedBox(
//             constraints: BoxConstraints(maxWidth: constraints.maxWidth),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: indicatorsData.map((data) {
//                   return buildCircularIndicator(
//                     data['category'],
//                     data['amount'],
//                     data['percentage'],
//                     cardHeight,
//                     data['color'],
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// Widget buildCircularIndicator(String category, String amount, double percentage,
//     double cardHeight, Color color) {
//   return CustomCircularProgressIndicator(
//     category: category,
//     amount: amount,
//     percentage: percentage,
//     backgroundColor: Colors.grey,
//     foregroundColor: color,
//     size: cardHeight,
//     strokeWidth: 15,
//   );
// }
class RevenueCard extends StatelessWidget {
  const RevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    double width = media.width;
    double height = media.height;
    double cardHeight = height * 0.2;
    return SizedBox(
      width: width,
      child: Card(
        color: Colors.white,
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                // Wrap Row in Center
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicatorsData.map((data) {
                    return buildCircularIndicator(
                      data['category'],
                      data['amount'],
                      data['percentage'],
                      cardHeight,
                      data['color'],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget buildCircularIndicator(String category, String amount, double percentage,
    double cardHeight, Color color) {
  return CustomCircularProgressIndicator(
    category: category,
    amount: amount,
    percentage: percentage,
    backgroundColor: Colors.grey,
    foregroundColor: color,
    size: cardHeight,
    strokeWidth: 15,
  );
}

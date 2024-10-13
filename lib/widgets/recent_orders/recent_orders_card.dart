import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/common/section_header.dart';
import 'package:vetqure_task/widgets/recent_orders/recent_orders_item.dart';

class RecentOrdersCard extends StatelessWidget {
  const RecentOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var isLargeScreen = constraints.maxWidth > 1300;
      double cardHeight = isLargeScreen ? 300 : constraints.maxHeight * 0.3;
      var media = MediaQuery.of(context).size;
      double cardWidth =
          media.width > 1300 ? media.width * 0.25 : media.width * 0.9;
      return SizedBox(
        height: cardHeight,
        width: cardWidth,
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                SectionHeader(title: 'Recent Orders', isFilter: false),
                RecentOrdersItem(
                  buttonText: 'Pending',
                  buttonColor: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                RecentOrdersItem(
                  buttonText: 'Pending',
                  buttonColor: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                RecentOrdersItem(
                  buttonText: 'Deliverd',
                  buttonColor: Colors.green,
                ),
                SizedBox(
                  height: 10,
                ),
                RecentOrdersItem(
                  buttonText: 'Return',
                  buttonColor: Colors.orange,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

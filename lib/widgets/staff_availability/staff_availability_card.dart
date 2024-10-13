import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/common/section_header.dart';
import 'package:vetqure_task/widgets/staff_availability/staff_item.dart';

class StaffAvailabilityCard extends StatelessWidget {
  const StaffAvailabilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var isLargeScreen = constraints.maxWidth > 1300;
        double cardHeight = isLargeScreen ? 300 : 500;
        var media = MediaQuery.of(context).size;
        double cardWidth =
            media.width > 1300 ? media.width * 0.25 : media.width * 0.9;

        return Center(
          child: SizedBox(
            height: cardHeight,
            width: cardWidth,
            child: Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SectionHeader(
                          title: 'Staff Availability', isFilter: false),
                      StaffItem(
                          buttonText: 'Available', buttonColor: Colors.red),
                      SizedBox(height: 10),
                      StaffItem(buttonText: 'Leave', buttonColor: Colors.green),
                      SizedBox(height: 10),
                      StaffItem(
                          buttonText: 'Available', buttonColor: Colors.red),
                      SizedBox(height: 10),
                      StaffItem(buttonText: 'Leave', buttonColor: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/staff_availability/staff_item.dart';

class StaffAvailabilityCard extends StatelessWidget {
  const StaffAvailabilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var isLargeScreen = constraints.maxWidth > 600;
        double cardHeight = isLargeScreen ? 300 : constraints.maxHeight * 0.9;
        var media = MediaQuery.of(context).size;
        double cardWidth = isLargeScreen
            ? media.width * 0.27
            : media.width * 0.9; // Adjust width based on screen size

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Add padding for better layout on smaller screens
                  child: Column(
                    children: const [
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

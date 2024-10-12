import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      color: Colors.white,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title text adjusts size based on screen width
          Text(
            'Title',
            style: TextStyle(
              fontSize: screenWidth > 600 ? 24 : 18, // Larger font for bigger screens
              fontWeight: FontWeight.bold,
            ),
          ),
          // Adjust the NavItem padding and spacing based on screen size
          NavItem(
            icon: Icon(Icons.message, size: screenWidth > 600 ? 28 : 20), // Icon size adjusts
            title: 'Message',
            fontSize: screenWidth > 600 ? 18 : 14, // Text size adjusts
            padding: screenWidth > 600 ? 16 : 8, // Padding adjusts
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final double fontSize;
  final double padding;

  const NavItem({
    super.key,
    required this.title,
    required this.icon,
    required this.fontSize,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
